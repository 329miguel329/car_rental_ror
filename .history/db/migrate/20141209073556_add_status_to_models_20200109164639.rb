class AddStatusToModels < ActiveRecord::Migration[5.2]
  def change
    add_column :settings, :status, :string
    add_column :clocks, :status, :string
  end
end
