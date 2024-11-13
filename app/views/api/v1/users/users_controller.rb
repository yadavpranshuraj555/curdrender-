# app/controllers/api/v1/users_controller.rb
class Api::V1::UsersController < ApplicationController
    def send_welcome_email
      user = User.find(params[:id])
      
      if UserMailer.welcome_email(user).deliver_now
        render json: { message: 'Email sent successfully' }, status: :ok
      else
        render json: { message: 'Email sending failed' }, status: :unprocessable_entity
      end
    end
  end
  