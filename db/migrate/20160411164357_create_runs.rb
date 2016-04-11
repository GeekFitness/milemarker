class CreateRuns < ActiveRecord::Migration
  def change
    create_table :runs do |t|
      t.decimal :miles
      t.integer :run_id
      t.integer :shoe_id
      t.integer :runner_id
      t.datetime :run_date
    end
  end
end
