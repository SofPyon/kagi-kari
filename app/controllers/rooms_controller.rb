class RoomsController < ApplicationController
  before_action :require_log_in
  before_action :set_room, only: [:edit, :update, :destroy]

  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      flash[:success] = "New room created."
      redirect_to rooms_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @room.update_attributes(room_params)
      flash[:success] = "Updated."
      redirect_to rooms_path
    else
      render 'edit'
    end
  end

  def destroy
    @room.destroy
    flash[:success] = "Destroyed."
    redirect_to rooms_path
  end

  private

    # before actions

    def set_room
      @room = Room.find_by_id(params[:id])
    end

    def room_params
      params.require(:room).permit(:name, :description)
    end
end
