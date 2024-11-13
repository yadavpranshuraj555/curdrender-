class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }

  def generate_password_reset_code!
    self.reset_password_code = SecureRandom.random_number(1000000).to_s.rjust(6, '0') # Generates a 6-digit code
    self.reset_password_code_sent_at = Time.current
    save!(validate: false)  # Bypass validations to save only the reset code and timestamp
  end

  def password_reset_code_valid?
    reset_password_code_sent_at >= 10.minutes.ago # Code is valid for 10 minutes
  end

  def reset_password!(new_password)
    self.reset_password_code = nil
    self.password = new_password
    save!
  end

  def generate_jwt
    payload = { id: self.id, exp: 24.hours.from_now.to_i }
    JWT.encode(payload, Rails.application.secrets.secret_key_base)
  end
end
