class StaticPagesController < ApplicationController
  before_action :require_log_in

  def index
    @rooms = Room.includes(activities: :user).all
    @activities = Activity.all
  end
end
