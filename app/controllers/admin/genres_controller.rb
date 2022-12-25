class Admin::GenresController < ApplicationController
  before_action :admin_login_confirm
  
  def index
    @genre_new = Genre.new
    @genres = Genre.all
  end

  def create
    genre_new = Genre.new(genre_params)
    if genre_new.save
      redirect_to request.referer
    else
      @genre_new = Genre.new
      @genres = Genre.all
      render "index"
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def show
    @genre = Genre.find(params[:id])
    @items = Item.where("genre_id LIKE?", "#{@genre.id}").page(params[:page]).per(8) #8項目毎にページネート
  end

  def update
    genre = Genre.find(params[:id])
    if genre.update(genre_params)
      redirect_to admin_genres_path(genre)
    else
      @genre = Genre.find(params[:id])
      render "edit"
    end
  end

  def destroy
    genre = Genre.find(params[:id])
    genre
  end

  private

  def genre_params
    params.require(:genre).permit(:genre_name)
  end
end
