# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create logs for tracking purposes with email and password
# Log.create!(email: "user@example.com", password: "securepassword", created_at: Time.now)
# Log.create!(email: "admin@example.com", password: "adminpassword", created_at: Time.now)
# Log.create!(email: "guest@example.com", password: "guestpassword", created_at: Time.now)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?