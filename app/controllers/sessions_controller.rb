class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_screen_name(params[:session][:screen_name])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      # redirect_to root_path
    else
      flash[:danger] = "Invalid ID/Password Combination."
      redirect_to new_session_path
    end
  end
end
