class Admins::AuthorsController < AdminsController
  before_action :set_author, only: [:edit, :update, :destroy] 

  def index
    @authors = Author.all
    @author = Author.new
  end

  def create
    if Author.create(author_params)
      redirect_to admins_authors_path, notice: "新たな著者を登録しました"
    end
  end

  def edit
  end

  def update
    if @author.update(author_params) 
      redirect_to admins_authors_path, notice: "著者情報を更新しました"
    end
  end

  def destroy
    @author.destroy
    redirect_to admins_authors_path
  end

  private

    def author_params
      params.require(:author).permit(:author_name)
    end

    def set_author
      @author = Author.find(params[:id])
    end

end
