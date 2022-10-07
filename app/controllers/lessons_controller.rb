class LessonsController < ApplicationController
    before_action :set_lesson, only: [:show]

    def new
        @lesson = Lesson.new
    end

    def show
    end

    def create
        debugger
        @lesson = Lesson.new(lesson_params)
        if @lesson.save
            flash[:success] = "Lesson was successfully created"
            teacher = Teacher.find_by_id(params[:lesson][:teacher_id])
            redirect_to teacher_path(teacher)
        else
            render 'new', status: :unprocessable_entity
        end
    end


    private

    def set_lesson
        @lesson = Lesson.find(params[:id])
    end

    def lesson_params
        params.require(:lesson).permit(:hour, :monday, :tuesday, :wednesday, :thursday, :friday, :group_id, :subject_id, :teacher_id)
    end
end