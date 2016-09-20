class OrganizationHasManyUsersThroughMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :members do |t|
      t.belongs_to :organization, index: true
      t.belongs_to :user, index: true
      t.integer :role, default: 0
      t.timestamps
    end
  end
end
