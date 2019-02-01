class RoomsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]
  before_action :set_room, only: [:show, :edit, :update, :destroy]
  before_action :is_mine, only: [:edit, :update, :destroy]
  # GET /rooms
  # GET /rooms.json
  def index
    @rooms = Room.all
  end

  # GET /rooms/1
  # GET /rooms/1.json
  def show
    if user_signed_in?
      session[:user_id] = current_user.id
    end

    @all = false
    @firstScroll = true
    if params[:all].present? && params[:all] == 'true'
      @messages = Message.where('room_id = ?', params[:id]).order(id: :asc)
      @all = true
      @firstScroll = false
    else
      viewCount = 50
      @messages = Message.where('room_id = ?', params[:id])
      if @messages.count > viewCount
        @messages = @messages.offset(@messages.count - viewCount).limit(viewCount).order(id: :asc)
      else
        if request.referer =~ /.*rooms.*/
          @all = false
          @firstScroll = false
        else
          @all = true
        end
      end
    end
  end

  # GET /rooms/new
  def new
    @room = Room.new
  end

  # GET /rooms/1/edit
  def edit
  end

  # POST /rooms
  # POST /rooms.json
  def create
    @room = Room.new(room_params)

    respond_to do |format|
      if @room.save
        format.html { redirect_to @room, notice: 'Room was successfully created.' }
        format.json { render :show, status: :created, location: @room }
      else
        format.html { render :new }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rooms/1
  # PATCH/PUT /rooms/1.json
  def update
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to @room, notice: 'Room was successfully updated.' }
        format.json { render :show, status: :ok, location: @room }
      else
        format.html { render :edit }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rooms/1
  # DELETE /rooms/1.json
  def destroy
    @room.destroy
    respond_to do |format|
      format.html { redirect_to rooms_url, notice: 'Room was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_room
      @room = Room.find(params[:id])
    end

    def room_params
      params.require(:room).permit(:category_id, :title, :user_id)
    end

    def is_mine
      if @room.user_id != current_user.id
        redirect_to root_path
      end
    end
end
