class AddIndexEverywhere < ActiveRecord::Migration
  def change
    add_index :products, :inventory
    add_index :sales, :sale_quantity
    add_index :factories, :selling_quantity
  end
end
