# frozen_string_literal: true

class ApplicationController < ActionController::API
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    render status: :unauthorized, json: { error: 'You are not authorized to access this resource' }
  end
end
