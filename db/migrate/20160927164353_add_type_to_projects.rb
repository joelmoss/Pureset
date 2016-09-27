class AddTypeToProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :type, :string, default: 'Project'
  end
end
