class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_screen_name(params[:session][:screen_name])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      # redirect_to root_path
    else
      redirect_to new_session_path, alert: "Invalid ID/Password Combination."
    end
  end
end
