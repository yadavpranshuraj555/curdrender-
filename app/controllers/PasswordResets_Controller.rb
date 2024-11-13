class PasswordResetsController < ApplicationController
  # skip_before_action :authenticate_request
  
    def create
     user = User.find_by(email: params[:email])
      if user
        user.generate_password_reset_code!
        PasswordResetMailer.send_reset_code(user).deliver_now
        render json: { message: "Password reset code sent to your email." }, status: :ok
      else
        render json: { error: "Email not found" }, status: :not_found
      end
    end
  
    def verify_code
     
     user = User.find_by(email: params[:email])
      if user.nil?
        render json: { error: "User not found with the provided email." }, status: :not_found
        return
      end

      if user.reset_password_code == params[:code] && user.password_reset_code_valid?
        render json: { message: "Code is valid. Please enter your new password." }, status: :ok
      else
        render json: { error: "Invalid or expired code." }, status: :unauthorized
      end
    end
  
    def reset_password
     
      user = User.find_by(reset_password_code: params[:code])
      if user&.password_reset_code_valid?
        if params[:password] == params[:password_confirmation]
          user.reset_password!(params[:password])
          render json: { message: "Password successfully updated." }, status: :ok
        else
          render json: { error: "Passwords do not match." }, status: :unprocessable_entity
        end
      else
        render json: { error: "Invalid or expired code." }, status: :unauthorized
      end
    end
  end
  
