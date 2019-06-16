class Api::V1::UsersController < ApplicationController

  def show
    set_user
    @token = request.headers['token']
    if is_authorized(@token)
      get_email
      if @email == @user.email
        render json: { user: UserSerializer.new(@user) }, status: :accepted
      else
        render json: { errors: "Token does not match user"}, status: :unauthorized
      end
    else
      render json: { errors: "Token not authorized"}, status: :unauthorized
    end
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


  def user_params
    params.require(:user).permit(:email)
  end

  def get_email
    validator = GoogleIDToken::Validator.new
    required_audience = '878175886111-51c80bg0o8j56jlpqpvt4fvjvr0plakc.apps.googleusercontent.com'
    optional_client_id = '878175886111-51c80bg0o8j56jlpqpvt4fvjvr0plakc.apps.googleusercontent.com'
    payload = validator.check(@token, required_audience, optional_client_id)
    @email = payload['email']
  end

end
