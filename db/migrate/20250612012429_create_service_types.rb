class CreateServiceTypes < ActiveRecord::Migration[8.0]
  def change
    create_table :service_types do |t|
      t.jsonb :title, null: false, default: {}
      t.integer :request_count, null: false, default: 0
      t.references :category, null: false, foreign_key: { to_table: :categories }
      t.references :subcategory, null: false, foreign_key: { to_table: :categories }
      t.string :banner_image, null: false
      t.string :icon, null: false
      t.timestamps
    end
  end
end
