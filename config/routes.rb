Rails.application.routes.draw do
  # devise_for :admin_users, ActiveAdmin::Devise.config
  # devise_for :admin_users, ActiveAdmin::Devise.config

  # ActiveAdmin.routes(self)
  
  # Define the route for user signup
  post 'signup', to: 'accounts#signup'

  # Define the route for user login
  post 'login', to: 'sessions#create'

  # Define routes for password resets
  post 'password_resets', to: 'password_resets#create'
  post 'password_resets/verify', to: 'password_resets#verify_code'
  post 'password_resets/reset_password', to: 'password_resets#reset_password'

  # Add any other routes as needed
end