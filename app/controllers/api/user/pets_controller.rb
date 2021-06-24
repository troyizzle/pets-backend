module Api
  module User
    class PetsController < ApplicationController
      before_action :set_user_pet, only: %w[me]
      before_action :authenticate_user!

      def create
        @user_pet = ::User::Pet.new(user_pet_params)
        # TODO: This should just be user = current_user
        @user_pet.user_id = current_user.id
        @user_pet.attach_remote_uri(params[:user_pet][:pet_image_uri])

        if @user_pet.save
          render json: ::User::PetSerializer.new(@user_pet).serializable_hash
        else
          render json: @user_pet.errors, status: :unprocessable_entity
        end
      end

      def me 
        render json: ::User::PetSerializer.new(@user_pet).serializable_hash
      end

      private

      def set_user_pet
        @user_pet = current_user.pet
      end

      def user_pet_params
        params
          .require(:user_pet)
          .permit(:name, :gender, :pet_id, backgrounds_attributes: [:question_id, :answer_id])
      end
    end
  end
end
