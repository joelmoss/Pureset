class AddPathAndContextIdToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :path, :string, index: true, unique: true
    add_column :tasks, :sequential_id, :integer
  end
end
