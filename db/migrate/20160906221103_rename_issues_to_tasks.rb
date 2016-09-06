class RenameIssuesToTasks < ActiveRecord::Migration[5.0]
  def change
    rename_table :issues, :tasks
  end
end
