class LessonPlansController < ApplicationController
    authorize_resource through: :user

    def show
        @lessons_plan = plan_today
        @lessons_monday = plan_monday
        @lessons_tuesday = plan_tuesday
        @lessons_wednesday = plan_wednesday
        @lessons_thursday = plan_thursday
        @lessons_friday = plan_friday
    end

    ['monday', 'tuesday', 'wednesday', 'thursday', 'friday'].each do |day|
        define_method("plan_#{day}") do
            LessonPlan.new(day, teacher).schedule_today
        end
    end

    def plan_today
        day = DateTime.now.strftime("%A").downcase
        LessonPlan.new(day, teacher).schedule_today
    end

    
    private

    def teacher
        @teacher ||= Teacher.find(params[:id])
    end

end