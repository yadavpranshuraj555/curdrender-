# app/mailers/user_mailer.rb
class UserMailer < ApplicationMailer
  default from: 'your_email@example.com'

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to Our Platform')
  end
end
