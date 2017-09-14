class CreateCode < ActiveRecord::Migration[5.1]
  def change
    create_table :codes do |t|
      t.string :title
      t.text :content
    end
  end
end
