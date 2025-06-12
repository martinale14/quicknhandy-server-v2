class CreateApiTokens < ActiveRecord::Migration[8.0]
  def change
    create_table :api_tokens do |t|
      t.string :token, null: false, index: { unique: true }
      t.references :session, null: false, foreign_key: true
      t.datetime :expires_at, null: false
      t.timestamps
    end
  end
end
