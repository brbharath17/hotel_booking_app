class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      # skipping password since login is not required
      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end
