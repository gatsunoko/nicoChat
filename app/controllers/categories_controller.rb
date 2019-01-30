class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @rooms = Room.where(category_id: params[:id]).order(created_at: :desc)
  end
end
