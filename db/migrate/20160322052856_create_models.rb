class CreateModels < ActiveRecord::Migration
  def change
    create_table :models do |t|
      t.string, :name
      t.string, :model_slug
      t.integer :organization_id

      t.timestamps
    end
    add_index :models, :organization_id
  end
end
