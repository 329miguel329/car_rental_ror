class ChangeTimeField < ActiveRecord::Migration[5.2]
  def change
    remove_column :clocks, :time
    add_column :clocks, :time, :datetime
  end
end
