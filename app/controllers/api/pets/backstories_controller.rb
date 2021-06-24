class Pet::BackstoriesController < ApplicationController
  before_action :set_pet_backstory, only: [:show, :update, :destroy]

  # GET /pet/backstories
  def index
    @pet_backstories = Pet::Backstory.all

    render json: @pet_backstories
  end

  # GET /pet/backstories/1
  def show
    render json: @pet_backstory
  end

  # POST /pet/backstories
  def create
    @pet_backstory = Pet::Backstory.new(pet_backstory_params)

    if @pet_backstory.save
      render json: @pet_backstory, status: :created, location: @pet_backstory
    else
      render json: @pet_backstory.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pet/backstories/1
  def update
    if @pet_backstory.update(pet_backstory_params)
      render json: @pet_backstory
    else
      render json: @pet_backstory.errors, status: :unprocessable_entity
    end
  end

  # DELETE /pet/backstories/1
  def destroy
    @pet_backstory.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pet_backstory
      @pet_backstory = Pet::Backstory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pet_backstory_params
      params.require(:pet_backstory).permit(:pet_id)
    end
end
