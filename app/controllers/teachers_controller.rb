class TeachersController < ApplicationController
    before_action :set_user, only: [:show, :edit]
    load_and_authorize_resource

    def index
        @teachers = Teacher.all
    end

    def show
    end

    def edit 
    end

    def update
        if @teacher.update(teacher_params)
            flash[:success] = "Your user was successfully updated"
            redirect_to teacher_path(@teacher)
        else
            render 'edit', status: :unprocessable_entity
        end
    end

    private

    def set_user
        @teacher = Teacher.find(params[:id])
    end

    def teacher_params
        params.require(:teacher).permit(:first_name, :last_name, :email, :password, :password_confirmation).delete_if { |_k, v| v.blank? }
    end
end