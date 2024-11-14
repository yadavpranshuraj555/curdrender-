Rails.application.routes.draw do
  get 'home/index'
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

  # Set a root route for the root path ("/")
  root 'home#index' # Update 'home#index' to the controller#action you want to display

  # Add any other routes as needed
end
