module Api
  class PetsController < ApplicationController
    before_action :set_pet, only: [:show, :update, :destroy]

    # GET /pets
    def index
      @pets = Pet.all

      options = { include: %i[backstory], collection: true}
      render json: PetSerializer.new(@pets, options).serializable_hash
    end

    # GET /pets/1
    def show
      render json: @pet
    end

    # POST /pets
    def create
      @pet = Pet.new(pet_params)

      if @pet.save
        render json: @pet, status: :created, location: @pet
      else
        render json: @pet.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /pets/1
    def update
      if @pet.update(pet_params)
        render json: @pet
      else
        render json: @pet.errors, status: :unprocessable_entity
      end
    end

    # DELETE /pets/1
    def destroy
      @pet.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_pet
        @pet = Pet.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def pet_params
        params.fetch(:pet, {})
      end
  end
end
