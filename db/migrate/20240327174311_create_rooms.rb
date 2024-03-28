class CreateRooms < ActiveRecord::Migration[7.1]
  def change
    create_table :rooms do |t|
      t.references :hotel, null: false, foreign_key: true
      t.string :number, null: false # Room number/Unique identifier
      t.integer :floor, null: false
      t.integer :beds, null: false, limit: 1
      t.decimal :price, null: false, precision: 15, scale: 2  # TODO: Move it to a separate table when dynamic pricing is needed
      t.timestamps
    end

    add_index :rooms, [:hotel_id, :number], unique: true
  end
end
