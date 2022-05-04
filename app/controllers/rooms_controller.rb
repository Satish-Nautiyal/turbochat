class RoomsController < ApplicationController
  before_action :authenticate_user!
  def index
    @room = Room.new()
    @rooms = Room.public_rooms
    @users =User.all_except(current_user)
    @selected_room = Room.find(params[:id]) if params[:id] 
    @message = Message.new()
    @messages = @selected_room.messages.order(created_at: :asc) if @selected_room.present?
  end

  def create
    @room = Room.new(room_params)
    @room.save
  end

  private
  def room_params
    params.require(:room).permit(:name)
  end
end
