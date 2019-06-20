class Api::V1::UsersController < ApplicationController

  def index
    users = User.all
    render json: users
  end

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

  def update
    set_user
    if @user.update(user_params)
      render json: @user, status: :accepted
    else
      render json: { error: 'failed to update user' }, status: :not_acceptable
    end
  end

  def destroy
  end

  def friends
    set_user

    friends = UserRelationship.where(follower_id: @user.id, confirmed: true).pluck(:id, :followed_id)
    more_friends = UserRelationship.where(followed_id: @user.id, confirmed: true).pluck(:id, :follower_id)
    all_friends = friends + more_friends

    all_sent = UserRelationship.where(follower_id: @user.id, confirmed: false).pluck(:id, :followed_id)

    all_received = UserRelationship.where(followed_id: @user.id, confirmed: false).pluck(:id, :follower_id)

    render json: {friends: all_friends, sent: all_sent , received: all_received }, status: :accepted
  end

  private

  def set_user
    @user = User.find(params[:id])
  end


  def user_params
    params.require(:user).permit(:email, :neighborhood, :name, :img_url, :bio, :phone)
  end

  def get_email
    validator = GoogleIDToken::Validator.new
    required_audience = '878175886111-51c80bg0o8j56jlpqpvt4fvjvr0plakc.apps.googleusercontent.com'
    optional_client_id = '878175886111-51c80bg0o8j56jlpqpvt4fvjvr0plakc.apps.googleusercontent.com'
    payload = validator.check(@token, required_audience, optional_client_id)
    @email = payload['email']
  end

end
