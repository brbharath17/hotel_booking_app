class AddRoomPriceColumnToHotels < ActiveRecord::Migration[7.1]
  def change
    add_column :hotels, :price_per_room, :decimal, precision: 20, scale: 2, null: false, default: 0
  end
end
