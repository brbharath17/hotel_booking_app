class CreateHotels < ActiveRecord::Migration[7.1]
  def change
    create_table :hotels do |t|
      t.string :name, null: false
      t.text :address, null: false
      t.string :phone, null: false
      t.references :city, null: false, foreign_key: true
      t.timestamps
    end
  end
end
