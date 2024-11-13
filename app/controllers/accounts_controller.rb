class AccountsController < ActionController::API 
  # skip_before_action :authenticate_request, only: [:signup] # Skip for signup

  def signup
    user = User.new(user_params)
    if user.save
      render json: { user: user, message: "User created successfully" }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # POST /login
  def login
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      render json: { message: "Login successful" }, status: :ok
    else
      if user # Email is correct but password is incorrect
        user.generate_password_reset_code!
        PasswordResetMailer.password_reset_code(user).deliver_now
      else
        render json: { error: "Invalid email or password" }, status: :unauthorized
      end
    end
  end

  private

  def user_params
    params.require(:account).permit(:email, :password)
  end
end
  