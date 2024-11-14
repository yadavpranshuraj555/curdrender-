# class CreateUsers < ActiveRecord::Migration[7.1]
#   def change
#     create_table :users do |t|
#       t.string :email
#       t.string :encrypted_password

#       t.timestamps
#     end
#   end
# end
# # db/migrate/xxxxxx_create_users.rb
class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :encrypted_password, null: false

      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end


# rails generate model User email:string encrypted_password:string
# class AddResetPasswordToUsers < ActiveRecord::Migration[6.0]
#   def change
#     add_column :users, :reset_password_token, :string
#     add_column :users, :reset_password_sent_at, :datetime
#   end
# end
