class Public::GenresController < ApplicationController
  # before_action :admin_login_confirm

  def index
    @genre_new = Genre.new
    @genres = Genre.all
  end

  def show
    @genre = Genre.find(params[:id])
    @items = Item.where("genre_id LIKE?", "#{@genre.id}").page(params[:page]).per(10) #10項目毎にページネート
  end

  private

  def genre_params
    params.require(:genre).permit(:genre_name)
  end
end
