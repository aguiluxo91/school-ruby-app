class StudentsController < ApplicationController
    load_and_authorize_resource

    def index
        @students = current_user.is_a?(Teacher) ? current_user.students.paginate(page: params[:page]) 
        : current_user.is_a?(Student) ? current_user.colleagues.paginate(page: params[:page]) 
        : Student.all.paginate(page:params[:page], per_page: 10).order("group_id")
    end

    def show
        @student = Student.find(params[:id])
    end
end

