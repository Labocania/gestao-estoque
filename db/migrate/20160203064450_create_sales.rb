class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.integer :sale_quantity
      t.references :product, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
