class CreateAddresses < ActiveRecord::Migration[8.0]
  def change
    create_table :addresses do |t|
      t.string "address", null: false
      t.string "description"
      t.decimal "lat", precision: 10, scale: 6, null: false
      t.decimal "lon", precision: 10, scale: 6, null: false
      t.integer "tag", default: 2, null: false
      t.references :city, null: false, foreign_key: true
      t.references :user, null: true, foreign_key: true
      t.timestamps
    end
  end
end
