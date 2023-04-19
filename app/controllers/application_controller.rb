class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordInvalid, with: :base_render_unprocessable_entity

  def serialize(resource, option = {})
    ::ActiveModelSerializers::SerializableResource.new(
      resource,
      option
    ).as_json
  end

  private

  def base_render_unprocessable_entity(exception)
    render json: { message: exception.record.errors.full_messages }, status: :unprocessable_entity
  end
end
