class GenresController < ApplicationController
  def index
    @genres = Genre.all
  end

  def show
    @rooms = Room.where(genre_id: params[:id]).order(created_at: :desc)
  end
end
