class PasswordResetMailer < ApplicationMailer
  default from: 'no-reply@example.com'

  def password_reset(user)
    @user = user
    @token = user.reset_password_token
    @url  = edit_password_reset_url(token: @token)  # Adjusted to include the token only
    mail(to: @user.email, subject: 'Password Reset Instructions')
  end
end
