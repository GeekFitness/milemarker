class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.boolean :like
      t.integer :runner_id, :shoe_id
      t.timestamps
    end
  end
end
