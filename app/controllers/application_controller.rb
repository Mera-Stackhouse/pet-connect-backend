class ApplicationController < ActionController::API


  def login
    if is_authorized(app_params[:token])
      set_current_user
    else
      render json: {errors: 'Token is not authorized'}, status: :unauthorized
    end
  end

  def set_current_user
    if User.find_by(email: app_params[:email])
      @user = User.find_by(email: app_params[:email])
      render json: @user, status: :accepted
    else
      @user = User.create(email: app_params[:email], name: app_params[:name])
      render json: @user, status: :accepted
    end
  end

  def is_authorized(token)

    validator = GoogleIDToken::Validator.new
    required_audience = '878175886111-51c80bg0o8j56jlpqpvt4fvjvr0plakc.apps.googleusercontent.com'
    optional_client_id = '878175886111-51c80bg0o8j56jlpqpvt4fvjvr0plakc.apps.googleusercontent.com'


    begin
      payload = validator.check(token, required_audience, optional_client_id)
      @email = payload['email']
      if payload
        true
      else
        false
      end

      ## figure out how to show report?
    rescue GoogleIDToken::ValidationError => e
        ##report "Cannot validate: #{e}"
    end
  end

  private

  def app_params
    params.require(:application).permit(:token, :email, :name)
  end

end
