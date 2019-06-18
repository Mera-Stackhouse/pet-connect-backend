class Api::V1::PetsController < ApplicationController
  # before_action :get_pet, accept: [:create, :index]

  def index
    pets = Pet.all
    render json: pets
  end

  def profile
    render json: { user: UserSerializer.new(current_user) }, status: :accepted
  end

  def create
    @pet = Pet.create(pet_params)
    if @pet.valid?
      PetsUser.create(user_id: params[:pet][:userId], pet: @pet)
      render json: @pet, status: :created
    else
      render json: { error: 'failed to create pet' }, status: :not_acceptable
    end
  end

  def update
    get_pet
    @pet.update(pet_params)
    render json: @pet, status: :accepted
    # else
    #   render json: { error: 'failed to update pet' }, status: :not_acceptable
    # end
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
