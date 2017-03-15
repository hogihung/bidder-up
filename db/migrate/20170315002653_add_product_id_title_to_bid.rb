class AddProductIdTitleToBid < ActiveRecord::Migration[5.0]
  def change
    add_column :bids, :puid, :string
    add_column :bids, :title, :string
  end
end
