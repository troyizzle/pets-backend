module Api
  module User
    class PetsController < ApplicationController
      before_action :set_user_pet, only: %w[me food]
      before_action :authenticate_user!

      def index
        @user_pets = ::User::Pet.all
        options = { collection: true }
        render json: ::User::PetSerializer.new(@user_pets, options).serializable_hash
      end

      def create
        @user_pet = ::User::Pet.new(user_pet_params)
        # TODO: This should just be user = current_user
        @user_pet.user_id = current_user.id
        @user_pet.attach_remote_uri(params[:user_pet][:pet_image_uri])

        if @user_pet.save
          render json: ::User::PetSerializer.new(@user_pet).serializable_hash
        else
          render json: { error: @user_pet.errors.messages }, status: :unprocessable_entity
        end
      end

      def me
        render json: ::User::PetSerializer.new(@user_pet).serializable_hash
      end

      def food
        options = { collection: true, include: %i[food] }
        render json: ::User::Pet::FoodSerializer.new(@user_pet.food, options).serializable_hash
      end

      private

      def set_user_pet
        @user_pet = current_user.pet
      end

      def user_pet_params
        params
          .require(:user_pet)
          .permit(:name, :gender, :pet_id, backgrounds_attributes: %i[question_id answer_id])
      end
    end
  end
end
