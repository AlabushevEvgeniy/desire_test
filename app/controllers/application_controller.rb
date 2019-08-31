class ApplicationController < ActionController::API
  include ActionController::MimeResponds

  def render_resource(resource)
    if resource.errors.empty?
      render json: resource
    else
      validation_error(resource)
    end
  end

  def validation_error(resource)
    render json: {
      errors: [
        {
          status: '422',
          title: 'Validation Error',
          detail: resource.errors,
        }
      ]
    }, status: :unprocessable_entity
  end

  def current_user_can_edit?(model)
    user_signed_in? && model.user == current_user
  end
end
