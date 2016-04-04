class CreateRunners < ActiveRecord::Migration
  def change
    create_table :runners do |t|
      t.string :runnername
      t.string :email
      t.timestamps
    end
  end
end
