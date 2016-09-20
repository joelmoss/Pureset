class CreateSlugs < ActiveRecord::Migration[5.0]
  def change
    create_table :slugs do |t|
      t.string :slug, null: false
      t.references :sluggable, polymorphic: true, index: true
    end

    add_index :slugs, :slug, unique: true
  end
end
