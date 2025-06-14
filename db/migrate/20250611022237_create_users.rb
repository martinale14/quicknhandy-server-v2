class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :email, null: false, index: { unique: true }
      t.string :password_digest, null: false
      t.string :reset_password_token
      t.datetime :reset_password_token_sent_at
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.virtual :name, type: :string, as: "first_name || ' ' || COALESCE(last_name, '')", stored: true, null: false
      t.string :time_zone, null: false
      t.string :zip_code, null: false
      t.date :birthday, null: false
      t.string :phone_number, null: false
      t.string :country_code, null: false
      t.boolean :suspended_indefinitely, null: false, default: false
      t.datetime :suspended_until
      t.string :suspention_message
      t.boolean :active, null: false, default: true
      t.string :profile_picture
      t.string :temporary_password_digest
      t.datetime :temporary_password_created_at
      t.timestamps
    end
  end
end
