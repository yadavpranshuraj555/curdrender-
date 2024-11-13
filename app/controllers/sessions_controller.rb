require 'jwt'

class SessionsController < ApplicationController
# class Admin::SessionsController < Devise::SessionsController
  
  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      # Generate token
      payload = { user_id: user.id, exp: 24.hours.from_now.to_i }
      token = JWT.encode(payload, Rails.application.secrets.secret_key_base)

      render json: { token: token }, status: :ok
    else
      render json: { error: 'Invalid credentials' }, status: :unauthorized
    end
  end
end
