require 'rails_helper'

RSpec.describe "/api/v1/metrics", type: :request do
  describe "GET /stats" do
    let!(:metric1) { create(:metric_info, value: 4.0, timestamp_value: Time.zone.parse('May 1 2022 10:40'), name: 'metric 1') }
    let!(:metric2) { create(:metric_info, value: 8.0, timestamp_value: Time.zone.parse('May 1 2022 10:40'), name: 'metric 2')}
    let!(:metric3) { create(:metric_info, value: 4.0, timestamp_value: Time.zone.parse('May 2 2022 11:41'), name: 'metric 3')}
    let!(:metric4) { create(:metric_info, value: 8.0, timestamp_value: Time.zone.parse('May 2 2022 11:41'), name: 'metric 4')}

    it "renders day metrics stats" do
      get api_v1_metrics_stats_url, params: { metric_info: { timestamp_type: :day } }
      expect(response).to have_http_status(:ok)
      data = JSON.parse(response.body)
      expect(data).to match_array([{"name"=>"May 01 22", "value"=>6.0}, {"name"=>"May 02 22", "value"=>6.0}])
    end

    it "renders hour metrics stats" do
      get api_v1_metrics_stats_url, params: { metric_info: { timestamp_type: :hour } }
      expect(response).to have_http_status(:ok)
      data = JSON.parse(response.body)
      expect(data).to match_array([{"name"=>"May 01 22 10:00", "value"=>6.0}, {"name"=>"May 02 22 11:00", "value"=>6.0}])
    end

    it "renders minute metrics stats" do
      get api_v1_metrics_stats_url, params: { metric_info: { timestamp_type: :minute } }
      expect(response).to have_http_status(:ok)
      data = JSON.parse(response.body)
      expect(data).to match_array([{"name"=>"May 02 22 11:41", "value"=>6.0}, {"name"=>"May 01 22 10:40", "value"=>6.0}])
    end
  end
end
