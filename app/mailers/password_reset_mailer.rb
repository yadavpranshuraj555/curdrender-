# class PasswordResetMailer < ApplicationMailer
#   default from: 'no-reply@example.com'

#   def send_reset_code(user)
#     @user = user
#     @code = user.reset_password_code

#     mail(to: @user.email, subject: 'Your Password Reset Code') do |format|
#             format.html { render "password_reset" }
#           end
#   end
# end
 
class PasswordResetMailer < ApplicationMailer
  default from: 'no-reply@example.com'

  def send_reset_code(user)
    @user = user
    @code = user.reset_password_code

    Rails.logger.info "Sending password reset email to #{@user.email}"

    mail(to: @user.email, subject: 'Your Password Reset Code') do |format|
      format.html { render "password_reset_mailer/password_reset" }
    end
  end
end
