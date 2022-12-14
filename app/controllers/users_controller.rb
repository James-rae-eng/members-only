class UsersController < ApplicationController
    before_action :authenticate_user!

    def index
        @users = User.all
    end

    def new
        @user = User.new
    end
 
    def create
        @user = User.new(user_params)

        if @user.save
            redirect_to posts_path
        else
            render :new, status: :unprocessable_entity
        end
    end

    private

    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:email,:username,:password)
    end
end
