class CreateContracts < ActiveRecord::Migration[5.2]
  def change
    create_table :contracts do |t|
      t.references :user, foreign_key: true
      t.references :passenger, foreign_key: true
      t.string :origin
      t.string :destination
      t.string :distance
      t.string :minute_time
      t.string :price

      t.timestamps
    end
  end
end
