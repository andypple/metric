module V1::Metrics
  class StatsSerializer < ApiSerializer
    attributes :name, :value

    def value
      object.avg_value.to_f
    end
  end
end
