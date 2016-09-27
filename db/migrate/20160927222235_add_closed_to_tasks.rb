class AddClosedToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :closed, :boolean, default: false
  end
end
