require "rails_helper"

RSpec.describe Api::V1::Metrics::StatsController, type: :routing do
  describe "routing" do
    it "routes to #stats" do
      expect(get: "/api/v1/metrics/stats").to route_to("api/v1/metrics/stats#index")
    end
  end
end
