class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]

  def show 
    @user = User.find params[:id]
    @rooms = Room.where(user_id: @user.id).order(id: :desc)
  end

  def edit
    @user = User.find current_user.id
  end

  def update
    @user = User.find current_user.id
    if @user.update(user_params)
      redirect_to user_path(current_user.id)
    else
      render 'edit'
    end
  end

  private
    def user_params
      params.require(:user).permit(:name)
    end
end
