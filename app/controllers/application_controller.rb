class ApplicationController < ActionController::API


  def login
    if is_authorized(params['token'])
      'logged in'
    else
      'nope'
    end
  end

  def is_authorized(token)
    
    validator = GoogleIDToken::Validator.new
    required_audience = '878175886111-51c80bg0o8j56jlpqpvt4fvjvr0plakc.apps.googleusercontent.com'
    optional_client_id = '878175886111-51c80bg0o8j56jlpqpvt4fvjvr0plakc.apps.googleusercontent.com'


    begin
      payload = validator.check(token, required_audience, optional_client_id)
      if payload
        true
      else
        false
      end
      ##email = payload['email']
      ## figure out how to show report?
    rescue GoogleIDToken::ValidationError => e
        ##report "Cannot validate: #{e}"
    end
  end

end
