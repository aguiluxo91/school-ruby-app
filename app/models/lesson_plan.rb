# LessonPlan.new("Monday", @teacher).schedule

class LessonPlan
    def initialize(day, teacher)
        @teacher = teacher
        @day = day.downcase if day
    end

    def schedule
        @teacher.lessons.where("#{@day}": true).order(:hour) if @day
    end

end
