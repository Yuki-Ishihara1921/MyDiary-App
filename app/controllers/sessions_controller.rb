class SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to root_path, notice: 'おかえりなさい！'
    else
      redirect_to signin_path, notice: 'ユーザーが正しくありません'
    end
  end

  def destroy
    if logged_in?
      log_out
      redirect_to signin_path
    end
  end
end
