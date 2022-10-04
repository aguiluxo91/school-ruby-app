class AddGroupIdToUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :group
  end
end
