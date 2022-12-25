class Public::GenresController < ApplicationController
  # before_action :admin_login_confirm

  def index
    @genre_new = Genre.new
    @genres = Genre.all.page(params[:page]).per(10) #10項目毎にページネート
  end

  def show
    @genres = Genre.all
    @genre = Genre.find(params[:id])
    @items = Item.where("genre_id LIKE?", "#{@genre.id}").page(params[:page]).per(8) #8項目毎にページネート
    @all_items = Item.where("genre_id LIKE?", "#{@genre.id}")
  end

  private

  def genre_params
    params.require(:genre).permit(:genre_name)
  end
end
