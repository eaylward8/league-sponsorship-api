class CreateLeagues < ActiveRecord::Migration[5.2]
  def change
    create_table :leagues do |t|
      t.string :name, null: false
      t.decimal :lat, null: false
      t.decimal :lng, null: false
      t.integer :price, null: false
    end
  end
end
