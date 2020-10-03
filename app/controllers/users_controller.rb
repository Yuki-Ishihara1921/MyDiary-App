class UsersController < ApplicationController
    before_action :set_current_user, only: [:index]

    def index
        @user = User.find(current_user.id)
    end

    def show
        @user = User.find(params[:id])
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            log_in @user
            redirect_to root_path
        else
            render 'new'
        end
    end

    private
        def user_params
            params.require(:user).permit(:name, :password, :password_confirmation)
        end
end
