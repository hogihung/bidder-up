class CreateBidders < ActiveRecord::Migration[5.0]
  def change
    create_table :bidders do |t|
      t.string  :first_name
      t.string  :last_name
      t.float :limit
      t.boolean :active

      t.timestamps
    end
  end
end
