class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:session][:name])
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to root_path, notice: 'おかえりなさい！'
    else
      redirect_to login_path, notice: 'ユーザーが正しくありません'
    end
  end

  def destroy
    if logged_in?
      log_out
      redirect_to login_path
    end
  end
end
