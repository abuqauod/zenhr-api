class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.string :email
      t.string :is_admin_boolean
      t.string :password_digest_string

      t.timestamps
    end
  end
end