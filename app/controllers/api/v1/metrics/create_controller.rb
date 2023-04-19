module Api::V1::Metrics
  class CreateController < ApplicationController
    def create
      @metric_info = MetricInfo.new(metric_info_params)

      if @metric_info.save
        render_success
      else
        render_error
      end
    end

    private

    def render_success
      serializer_opts = { serializer: ::V1::Metrics::CreateSerializer }
      render json: serialize(@metric_info, serializer_opts), status: :created
    end

    def render_error
      render json: serialize(@metric_info.errors), status: :unprocessable_entity
    end

    def metric_info_params
      @metric_info_params ||= params.require(:metric_info).permit(:timestamp_value, :name, :value)
    end
  end
end
