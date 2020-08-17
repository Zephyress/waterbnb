class AddPriceToBoats < ActiveRecord::Migration[6.0]
  def change
    add_column :boats, :price, :integer
  end
end

