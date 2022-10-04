class AddSubjectIdToLesson < ActiveRecord::Migration[7.0]
  def change
    add_reference :lessons, :subject
  end
end
