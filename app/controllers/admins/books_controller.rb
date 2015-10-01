class Admins::BooksController < AdminsController
  before_action :set_book,  only: [:edit, :update, :destroy]
  before_action :set_admin, only: [:new, :create, :update, :destroy]

  def show
    @book = Book.includes(:author, :publisher, :genre, stocks: [borrowing: [:user], stock_reservation: [:user]]).find(params[:id])
    @reviews = @book.reviews.where(params[:id]).includes(:user)
  end

  def new
    @book = Book.new
  end

  def create 
    if Book.create(book_params)
      redirect_to admins_top_index_path(@admin.id), notice: "新たな本を追加しました"
    end
  end

  def edit
  end

  def update
    if @book.update(book_params) 
      redirect_to admins_top_index_path(@admin.id), notice: "図書情報を更新しました"
    end
  end

  def destroy
    @book.destroy
    redirect_to admins_top_index_path(@admin.id), notice: "図書情報を削除しました"
  end

  private

  def set_admin
    @admin = current_admin
  end

    def book_params
      params.require(:book).permit(:title, :author_id, :publisher_id, :genre_id)
    end

    def set_book
      @book = Book.find(params[:id])
    end

end
