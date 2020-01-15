class CreateBloodTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :blood_types do |t|
      t.string :code, null: false
      t.string :name, null: false
      t.timestamps
    end
    add_index :blood_types, :code, unique: true
  end
end
