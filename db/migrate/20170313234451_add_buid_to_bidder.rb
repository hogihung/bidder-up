class AddBuidToBidder < ActiveRecord::Migration[5.0]
  def change
    add_column :bidders, :buid, :string
  end
end
