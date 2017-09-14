class CreateLife < ActiveRecord::Migration[5.1]
  def change
    create_table :lives do |t|
      t.string :title
      t.text :content
    end
  end
end
