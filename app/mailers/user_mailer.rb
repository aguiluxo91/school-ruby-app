class UserMailer < ApplicationMailer
    default from: "school-app@example.com"
    layout "mailer"

    def welcome_email
        @user = params[:user]
        @url  = 'http://localhost:3000/users/password/new'
        mail(to: @user.email, subject: 'Welcome to School App')
    end

    def daily_schedule_email
        @user = params[:user]
        mail(to: @user.email, subject: "Your Schedule for today, don't be late!")
    end
end