class Api::V1::UsersController < ApplicationController

  def show
    set_user
    render json: { user: UserSerializer.new(@user) }, status: :accepted
  end

  def create

  end

  def update

  end

  def destroy

  end

  private

  def set_user
    @user = User.find(params[:id])
  end



end
