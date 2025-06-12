class CreateCities < ActiveRecord::Migration[8.0]
  def change
    create_table :cities do |t|
      t.string :name, null: false
      t.string :code, null: false, index: { unique: true }
      t.references :country, null: false, foreign_key: true
      t.timestamps
    end
  end
end
