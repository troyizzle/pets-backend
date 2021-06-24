# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: %i[create]

  def create
    build_resource(sign_up_params)
    if resource.save
      sign_up(resource_name, resource) if resource.persisted?
      render json: UserSerializer.new(resource).serializable_hash
    else
      render json: { error: resource.errors.messages }, status: 422
    end
  end

  private
  
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end
end
