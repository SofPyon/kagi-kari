class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  layout 'main'

  private

    # Before actions

    def require_log_in
      unless current_user
        flash[:danger] = "Please log in."
        redirect_to new_session_path
      end
    end
end
