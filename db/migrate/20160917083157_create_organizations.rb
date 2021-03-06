class CreateOrganizations < ActiveRecord::Migration[5.0]
  def change
    create_table :organizations do |t|
      t.string :name, null: false
      t.string :slug, null: false
    end

    add_index :organizations, :slug, unique: true
  end
end
