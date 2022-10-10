class Teacher < User
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true
    has_many :lessons
    after_create :send_welcome_email


    def week_schedule(day)
        lessons.where("#{day}": true).order(:hour)
    end

    def send_daily_schedule_email
        UserMailer.with(user: self).daily_schedule_email.deliver_now
    end

    private
    def send_welcome_email
        UserMailer.with(user: self).welcome_email.deliver_now
    end
   
end