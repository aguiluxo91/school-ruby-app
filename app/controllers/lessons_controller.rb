class LessonsController < ApplicationController
    load_and_authorize_resource

    before_action :set_lesson, only: [:show, :edit, :update]

    def index
        @lessons = Lesson.where(teacher: current_user).order(:group_id)
    end

    def new
        @lesson = Lesson.new
    end

    def show
    end

    def edit

    end

    def update
        if @lesson.update(lesson_params)
            teacher = Teacher.find(params[:lesson][:teacher_id])
            flash[:success] = "Lesson was successfully created"
            redirect_to teachers_path(teacher)
        else
            render 'edit', status: :unprocessable_entity
        end
    end

    def create
        @lesson = Lesson.new(lesson_params)
        if @lesson.save
            teacher = Teacher.find(params[:lesson][:teacher_id])
            flash[:success] = "Lesson was successfully created"
            redirect_to teacher_path(teacher)
        else
            render 'new', status: :unprocessable_entity
        end
    end

    def destroy
        @lesson.destroy
        flash[:danger] = "Lesson was successfully deleted"
        redirect_to lessons_path status: :unprocessable_entity
    end


    private

    def set_lesson
        @lesson = Lesson.find(params[:id])
    end

    def lesson_params
        params.require(:lesson).permit(:hour, :monday, :tuesday, :wednesday, :thursday, :friday, :group_id, :subject_id, :teacher_id)
    end
end