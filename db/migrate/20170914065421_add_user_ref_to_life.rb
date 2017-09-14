class AddUserRefToLife < ActiveRecord::Migration[5.1]
  def change
    add_reference :lives, :user, foreign_key: true
  end
end
