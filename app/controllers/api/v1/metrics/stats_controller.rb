module Api::V1::Metrics
  class StatsController < ApplicationController
    def index
      @stats = if MetricInfo::GROUP_COLUMNS.keys.include?(stats_params[:timestamp_type])
                 MetricInfo.stats(stats_params[:timestamp_type])
               else
                 MetricInfo.none
               end
      render_success
    end

    private

    def render_success
      serializer_opts = { each_serializer: ::V1::Metrics::StatsSerializer }
      render json: serialize(@stats, serializer_opts), status: :ok
    end

    def stats_params
      @stats_params ||= params.require(:metric_info).permit(:timestamp_type)
    end
  end
end
