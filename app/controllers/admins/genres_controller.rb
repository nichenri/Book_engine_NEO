class Admins::GenresController < AdminsController
  before_action :set_genre, only: [:edit, :update, :destroy] 
  before_action :set_admin, only: [:create, :update, :destroy]

  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save 
      redirect_to admins_genres_path
    else 
      render 'new'
    end
  end

  def edit
  end

  def update
    if @genre.update(genre_params) 
      redirect_to admins_genres_path
    else 
      render 'edit'
    end
  end

  def destroy
    @genre.destroy
    redirect_to admins_genres_path
  end

  private

    def set_admin
      @admin = current_admin
    end

    def genre_params
      params.require(:genre).permit(:genre_name)
    end

    def set_genre
      @genre = Genre.find(params[:id])
    end

end
