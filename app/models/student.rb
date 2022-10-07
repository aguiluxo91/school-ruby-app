class Student < User
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :date_of_birth, presence: true
    belongs_to :group
    after_save :send_welcome_email

    def check_today_schedule
        day = Date.today.strftime('%A').downcase
        group.lessons.where("#{day}": true)
    end

    def week_schedule(day)
        group.lessons.where("#{day}": true).order(:hour)
    end

    def send_daily_schedule_email
        UserMailer.with(user: self).daily_schedule_email.deliver_now
    end

    private
    def send_welcome_email
        UserMailer.with(user: self).welcome_email.deliver_now
    end
end