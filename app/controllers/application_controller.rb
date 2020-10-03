class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    include SessionsHelper

    def set_current_user
        if logged_in?
          current_user = @current_user
        else
          redirect_to login_path
        end
    end
end
