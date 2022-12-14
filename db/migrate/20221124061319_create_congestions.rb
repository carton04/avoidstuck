class CreateCongestions < ActiveRecord::Migration[6.0]
  def change
    create_table :congestions do |t|
      t.integer :ski_resort_id, null: false
      t.text :situation
      t.integer :waiting,       null: false
      t.decimal :latitude,      null: false,precision: 10, scale: 7
      t.decimal :longitude,     null: false,precision: 10, scale: 7
      t.references :user,       null: false, foreign_key: true
      t.timestamps
    end
  end
end