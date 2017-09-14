class AddTimestampsToLife < ActiveRecord::Migration[5.1]
  def change
    add_column :lives, :created_at, :datetime
    add_column :lives, :updated_at, :datetime
  end
end
