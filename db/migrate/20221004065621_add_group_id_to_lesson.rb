class AddGroupIdToLesson < ActiveRecord::Migration[7.0]
  def change
    add_reference :lessons, :group
  end
end
