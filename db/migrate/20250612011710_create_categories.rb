class CreateCategories < ActiveRecord::Migration[8.0]
  def change
    create_table :categories do |t|
      t.jsonb :title, null: false, default: {}
      t.jsonb :description, null: false, default: {}
      t.string :icon, null: false
      t.integer :price_hour_cents, null: false
      t.string :ancestry, index: true
      t.timestamps
    end
  end
end
