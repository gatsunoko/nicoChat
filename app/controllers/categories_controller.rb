class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    @rooms = Room.all.order(id: :desc).limit(100).offset(0)
  end

  def show
    @rooms = Room.where(category_id: params[:id]).order(id: :desc)
  end
end
