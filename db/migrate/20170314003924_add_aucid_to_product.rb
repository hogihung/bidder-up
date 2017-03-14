class AddAucidToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :aucid, :string
  end
end
