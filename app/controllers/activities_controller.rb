class ActivitiesController < ApplicationController
  before_action :require_log_in

  def create
    room = Room.find(params[:activity][:room_id])
    activity = room.activities.build(activity_params)
    if activity.save
      flash[:success] = "Status changed."
    else
      flash[:danger] = "Invalid request."
    end

    redirect_to root_path
  end

  def destroy
    activity = Activity.find(params[:id])
    activity.destroy
    flash[:success] = "Activity destroyed."
    redirect_to root_path
  end

  private

    # strong params

    def activity_params
      params.require(:activity).permit(:action).
                                merge(user_id: current_user.id)
    end
end
