class TeachersController < ApplicationController
    before_action :set_user, only: [:show]
    load_and_authorize_resource

    def index
        @teachers = Teacher.all
    end

    def show
    end

    private

    def set_user
        @teacher = Teacher.find(params[:id])
    end
end