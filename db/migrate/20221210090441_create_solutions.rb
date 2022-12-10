class CreateSolutions < ActiveRecord::Migration[6.0]
  def change
    create_table :solutions do |t|
      t.integer :user_id,        null: false
      t.integer :congestion_id,  null: false
      t.timestamps
    end
  end
end
