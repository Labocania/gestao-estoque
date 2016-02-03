class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :inventory, default: 0
      t.string :type

      t.timestamps null: false
    end
  end
end
