# class Api::V1::UsersController < ApplicationController
#   def login
#     byebug
#     user = User.find_by(email: params[:email])

#     if user&.authenticate(params[:password])
#       render json: { message: 'Login successful', user: user }, status: :ok
#     else
#       render json: { error: 'Invalid email or password' }, status: :unauthorized
#     end
#   end
# end
