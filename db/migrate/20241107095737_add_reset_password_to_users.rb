# class AddResetPasswordFieldsToUsers < ActiveRecord::Migration[7.0]
#   def change
#     add_column :users, :reset_password_code, :string
#     add_column :users, :reset_password_code_sent_at, :datetime
#   end
# end
class AddResetPasswordToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :reset_password_token, :string
    add_column :users, :reset_password_sent_at, :datetime
  end
end
