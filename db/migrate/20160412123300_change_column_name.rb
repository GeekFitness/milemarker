class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :runs, :miles, :run_distance
  end
end
