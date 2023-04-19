module V1::Metrics
  class CreateSerializer < ApiSerializer
    attributes :id, :created_at, :updated_at, :timestamp_value, :name, :value

    def value
      object.value.to_f
    end
  end
end
