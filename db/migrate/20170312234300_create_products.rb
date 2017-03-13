class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string  :publisher
      t.string  :title
      t.float :reserve_price
      t.integer :quantity

      t.timestamps
    end
  end
end
