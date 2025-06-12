class CreateDevices < ActiveRecord::Migration[8.0]
  def change
    create_table :devices do |t|
      t.string :app_version, null: false
      t.string :app_build_number, null: false
      t.string :vendor_identifier, null: false
      t.references :session, null: false, foreign_key: true
      t.string :push_token, null: false
      t.decimal :lat, precision: 10, scale: 6
      t.decimal :lon, precision: 10, scale: 6
      t.timestamps
      t.index [ :lat, :lon ]
    end
  end
end
