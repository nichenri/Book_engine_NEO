class Admins::GenresController < AdminsController
  before_action :set_genre, only: [:edit, :update, :destroy] 

  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def create
    if Genre.create(genre_params)
      redirect_to admins_genres_path, notice: "新たな分野を追加しました"
    end
  end

  def edit
  end

  def update
    if @genre.update(genre_params) 
      redirect_to admins_genres_path, notice: "分野情報を更新しました"
    end
  end

  def destroy
    @genre.destroy
    redirect_to admins_genres_path
  end

  private

    def genre_params
      params.require(:genre).permit(:genre_name)
    end

    def set_genre
      @genre = Genre.find(params[:id])
    end

end
