class CreateCoverageZones < ActiveRecord::Migration[8.0]
  def change
    create_table :coverage_zones do |t|
      t.string :code, null: false, index: { unique: true }
      t.boolean :enabled, null: false, default: true
      t.references :city, null: false, foreign_key: true
      t.timestamps
    end
  end
end
