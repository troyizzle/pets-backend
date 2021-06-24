# frozen_string_literal: true

module Api
  class UsersController < Api::BaseController
    before_action :find_user, only: %w[show]

    def show
      render json: UserSerializer.new(@user).serializable_hash
    end

    def whoami
      render json: UserSerializer.new(current_user).serializable_hash
    end

    private

    def find_user
      @user = ::User.find(params[:id])
    end
  end
end
