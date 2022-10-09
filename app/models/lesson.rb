class Lesson < ApplicationRecord
    validates :hour, presence: true
    belongs_to :group
    belongs_to :teacher
    belongs_to :subject
    LESSON_TIME = 1
    validate :check_teacher_day_overlap, :check_group_day_overlap, :check_valid_hour, :check_at_least_one_day, :check_only_one_day


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

    def to_s
        "#{self.subject.name} at #{self.hour.hour}:00 for Group #{self.group.group_number}"
    end

    private

    def check_at_least_one_day
        errors.add(:monday, "One day must be checked") if ([monday, tuesday, wednesday, thursday, friday].all? { |day| !day })
    end

    def check_only_one_day
        errors.add(:monday, "You must check only one day") if ([monday, tuesday, wednesday, thursday, friday].select { |day| day == true}).count > 1
    end

    def check_valid_hour
        errors.add(:hour, "must be between 8 and 14") if hour && (hour.hour < 8 || hour.hour > 14)
    end

    def check_teacher_day_overlap
        days = day_selected
        teacher && days.each do |day|
            unless teacher.lessons.find_by(hour: self.hour, "#{day}": true).blank?
                errors.add(:hour, "Overlaped with #{teacher.lessons.find_by(hour: self.hour, "#{day}": true)} on #{day.capitalize}")
            end
        end    
    end

    def check_group_day_overlap
        days = day_selected
        group && days.each do |day|
            unless group.lessons.find_by(hour: self.hour, "#{day}": true).blank?
                errors.add(:hour, "Overlaped with #{group.lessons.find_by(hour: self.hour, "#{day}": true)} on #{day.capitalize}")
            end
        end  
    end

    def day_selected
        days = %w[monday tuesday wednesday thursday friday]
        result = []
        days.each { |day| result.push(day) if send("#{day}") }
        result
    end
end
