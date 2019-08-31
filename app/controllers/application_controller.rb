class ApplicationController < ActionController::API
  # include ActionController::MimeResponds
  # helper_method :current_user_can_edit?

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
    # Если у модели есть юзер и он залогиненный, пробуем у неё взять .event
    # Если он есть, проверяем его юзера на равенство current_user.
    user_signed_in? && model.user == current_user
  end
end
