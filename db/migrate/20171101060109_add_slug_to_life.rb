class AddSlugToLife < ActiveRecord::Migration[5.1]
  def change
    add_column :lives, :slug, :string
    add_index :lives, :slug, unique: true
  end
end
