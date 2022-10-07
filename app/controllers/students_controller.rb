class StudentsController < ApplicationController
    load_and_authorize_resource

    def index
        @students = Student.all
    end

    def show
        @student = Student.find(params[:id])
    end
end