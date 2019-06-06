class Api::V1::PetsController < ApplicationController
  before_action :get_pet, accept: :create

  def create
    @pet = Pet.create(pet_params)
    if @pet.valid?
      PetsUser.create(user: @user , pet: @pet)
      render json: @user, status: :created
    else
      render json: { error: 'failed to create pet' }, status: :not_acceptable
    end
  end

  def update
    if @pet.update(pet_params)
      render json:  {pet: @pet}, status: :accepted
    else
      render json: { error: 'failed to update pet' }, status: :not_acceptable
    end
  end

  def destroy
    @pet.destroy
    render json: @user, status: :accepted
  end

  private
  def pet_params
    params.require(:pet).permit(:name, :breed, :img_url)
  end

  def get_pet
    @pet = Pet.find(params[:id])
  end
end
