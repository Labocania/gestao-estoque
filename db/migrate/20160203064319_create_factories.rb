class CreateFactories < ActiveRecord::Migration
  def change
    create_table :factories do |t|
      t.integer :selling_quantity
      t.references :product, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
