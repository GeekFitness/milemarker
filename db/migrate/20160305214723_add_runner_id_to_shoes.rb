class AddRunnerIdToShoes < ActiveRecord::Migration
  def change
    add_column :shoes, :runner_id, :integer
  end
end
