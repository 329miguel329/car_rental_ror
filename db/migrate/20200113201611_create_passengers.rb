class CreatePassengers < ActiveRecord::Migration[5.2]
  def change
    create_table :passengers do |t|
      t.string :identification, null: false
      t.string :email, null: false
      t.string :phone, null: false

      t.timestamps
    end
    add_index :passengers, :email, unique: true
    add_index :passengers, :identification, unique: true
  end
end
