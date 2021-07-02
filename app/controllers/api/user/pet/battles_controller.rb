module Api
  module User
    module Pet
      class BattlesController < ApplicationController
        before_action :authenticate_user!
        before_action :set_user_pet_battle, only: %(show)

        def show
          options = { include: %w[challenger opponent] }
          render json: ::User::Pet::BattleSerializer.new(@user_pet_battle, options).serializable_hash
        end

        def create
          @user_pet_battle = ::User::Pet::Battle.new(user_pet_battle_params)

          if @user_pet_battle.save
            render json: ::User::Pet::BattleSerializer.new(@user_pet_battle).serializable_hash
          else
            render json: { error: @user_pet_battle.errors.messages }, status: :unprocessable_entity
          end
        end

        private

        def set_user_pet_battle
          @user_pet_battle = ::User::Pet::Battle.find(params[:id])
        end

        def user_pet_battle_params
          params
            .require(:user_pet_battle)
            .permit(:opponent_id, :challenger_id)
        end
      end
    end
  end
end
