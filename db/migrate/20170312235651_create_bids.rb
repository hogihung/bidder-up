class CreateBids < ActiveRecord::Migration[5.0]
  def change
    create_table :bids do |t|
      t.integer :quantity
      t.float :bid_amount
      t.string  :notes

      t.timestamps
    end
  end
end
