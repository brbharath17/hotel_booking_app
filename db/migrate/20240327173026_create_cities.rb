class CreateCities < ActiveRecord::Migration[7.1]
  def change
    create_table :cities do |t|
      t.string :name
      t.string :state, null: false # TODO: This should be a reference to a state model
      t.string :country, null: false # TODO: This should be a reference to a country model
      t.timestamps
    end

    add_index :cities, [:name, :state, :country], unique: true
  end
end
