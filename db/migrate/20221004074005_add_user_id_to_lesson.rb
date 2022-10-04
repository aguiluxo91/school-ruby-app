class AddUserIdToLesson < ActiveRecord::Migration[7.0]
  def change
    add_reference :lessons, :teacher
  end
end
