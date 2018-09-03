class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_screen_name(params[:session][:screen_name])
    if @user && @user.authenticate(params[:session][:password])
      log_in @user
      flash[:success] = "Logged in successfully."
      redirect_to root_path
    else
      flash[:danger] = "Invalid ID/Password Combination."
      redirect_to new_session_path
    end
  end

  def destroy
    log_out
    flash[:success] = "Logged out successfully."
    redirect_to new_session_path
  end
end
