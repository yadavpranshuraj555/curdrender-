class AddResetPasswordFieldsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :reset_password_code, :string
    add_column :users, :reset_password_code_sent_at, :datetime
  end
end
