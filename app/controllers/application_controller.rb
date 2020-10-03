class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    include SessionsHelper

    def set_current_user
        if logged_in?
            current_user = @current_user
            @user = User.find(current_user.id)
        else
            redirect_to login_path
            session[:user_id] = nil
            @current_user = nil
        end
    end

end
