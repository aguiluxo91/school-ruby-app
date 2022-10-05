class Teacher < User
    validates :first_name, presence: true
    validates :last_name, presence: true
    has_many :lessons

    def check_schedule(teacher)
        if Date.today.wday == 1
            Lesson.where(monday: true, teacher_id: teacher).order(:hour)
        elsif Date.today.wday == 2
            Lesson.where(tuesday: true, teacher_id: teacher.id).order(:hour)
        elsif Date.today.wday == 3
            Lesson.where("wednesday = true and teacher_id = teacher_id").order(:hour)
        elsif Date.today.wday == 4
            Lesson.where("thursday = true and teacher_id = teacher_id").order(:hour)
        else Date.today.wday == 5
            Lesson.where("friday = true and teacher_id = teacher_id").order(:hour)
        end
    end
end