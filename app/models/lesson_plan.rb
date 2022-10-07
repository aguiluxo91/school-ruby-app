# LessonPlan.new("Monday", @teacher).schedule

class LessonPlan
    def initialize(day, teacher)
        @teacher = teacher
        @day = day.downcase
    end

    def schedule_today
        @teacher.lessons.where("#{@day}": true).order(:hour)
    end

end
