class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def show
    # @room = Room.find(params[:id])
    # @messages = @room.messages
    @messages = Message.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to @room, notice: 'Chat room was successfully created.'
    else
      render :new
    end
  end

  private

  def room_params
    params.require(:room).permit(:name)
  end
end

