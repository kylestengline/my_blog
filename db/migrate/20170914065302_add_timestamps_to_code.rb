class AddTimestampsToCode < ActiveRecord::Migration[5.1]
  def change
    add_column :codes, :created_at, :datetime
    add_column :codes, :updated_at, :datetime
  end
end
