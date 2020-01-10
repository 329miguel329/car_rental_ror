class CreateCardTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :card_types do |t|
      t.string :code, null: false
      t.string :name, null: false
      t.timestamps
    end
    add_index :card_types, :code, unique: true
  end
end
