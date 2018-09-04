class ActivitiesController < ApplicationController
  before_action :require_log_in

  def create
    @room = Room.find(params[:activity][:room_id])
    @activity = @room.activities.build(activity_params)
    if @activity.save
      @room.reload
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    else
      flash[:danger] = "Invalid request."
      redirect_to root_path
    end
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
