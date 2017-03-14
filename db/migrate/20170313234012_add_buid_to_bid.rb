class AddBuidToBid < ActiveRecord::Migration[5.0]
  def change
    add_column :bids, :buid, :string
  end
end
