require 'rails_helper'

RSpec.describe "/api/v1/metrics", type: :request do
  describe "POST /create" do
    context "with valid parameters" do
      let(:valid_attributes) {
        FactoryBot.attributes_for(:metric_info)
      }

      it "creates a new MetricInfo" do
        expect {
          post api_v1_metrics_url,
               params: { metric_info: valid_attributes }, as: :json
        }.to change(MetricInfo, :count).by(1)
      end

      it "renders a JSON response with the new metric_info" do
        post api_v1_metrics_url,
             params: { metric_info: valid_attributes }, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
        data = JSON.parse(response.body)
        expect(data['name']).to eq valid_attributes[:name]
        expect(data['value']).to eq valid_attributes[:value]
        expect(Time.parse(data['timestamp_value'])).to be_within(1.second).of valid_attributes[:timestamp_value]
      end
    end

    context "with invalid parameters" do
      it "does not create a new MetricInfo" do
        expect {
          post api_v1_metrics_url,
               params: { metric_info: { name: 'missing timestamp and value'} }, as: :json
        }.to change(MetricInfo, :count).by(0)
      end

      it "renders a JSON response with errors for the new metric_info" do
        post api_v1_metrics_url,
             params: { metric_info: { name: 'missing timestamp and value' } }, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
        data = JSON.parse(response.body)
        expect(data).to include({"timestamp_value"=>["can't be blank"], "value"=>["can't be blank"]})
      end
    end
  end
end
