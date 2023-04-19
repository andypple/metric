require "rails_helper"

RSpec.describe Api::V1::Metrics::CreateController, type: :routing do
  describe "routing" do
    it "routes to #create" do
      expect(post: "/api/v1/metrics").to route_to("api/v1/metrics/create#create")
    end
  end
end
