class Lesson < ApplicationRecord
    validates :name, presence: true, uniqueness: { case_sensitive: false }
    validates :hour, presence: true
    belongs_to :group
    belongs_to :teacher
    belongs_to :subject
    LESSON_TIME = 1

    def end_hour
        hour.hour + LESSON_TIME
    end

    def check_lesson_days
        array_days = %w[monday tuesday wednesday thursday friday]
        days = ""
        array_days.each { |day| days += (day.capitalize == "Friday" ? "Friday" : "#{day.capitalize}, ") if check_day(day) }
        days
    end

    def check_day(day)
        send("#{day}")
    end

    
    
end
