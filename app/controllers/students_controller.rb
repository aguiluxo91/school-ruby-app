class StudentsController < ApplicationController
    load_and_authorize_resource

    def index
        @students = Student.all
    end

    def show
        @student = Student.find(params[:id])
        @students_group = Student.where(group: @student.group)
    end
end