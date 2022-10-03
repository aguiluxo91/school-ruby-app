class AddStudentAndTeacherToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :student, :boolean
    add_column :users, :teacher, :boolean
  end
end
