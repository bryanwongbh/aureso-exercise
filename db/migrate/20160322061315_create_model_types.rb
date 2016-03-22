class CreateModelTypes < ActiveRecord::Migration
  def change
    create_table :model_types do |t|
      t.string :name
      t.string :model_type_slug
      t.string :model_type_code
      t.decimal :base_price, precision: 10, scale: 2
      t.integer :model_id

      t.timestamps
    end
  end
end
