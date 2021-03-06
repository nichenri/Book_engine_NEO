class Users::BooksController < UsersController
  before_action :set_book,  only: [:show]

  def show
    @user = current_user
    @book = Book.includes(:author, :genre, :publisher, reviews: [:user]).find(params[:id])
    @bookmark = Bookmark.new
    @user_bookmark = @book.bookmarks.find_by(user_id: @user.id)
    @review = Review.new
    @book_reservation = BookReservation.new
    @stock_reservation = StockReservation.new
    @stocks = @book.stocks.includes(:borrowing, :stock_reservation)
    @all_stocks = Stock.all
  end


  private

    def book_params
      params.require(:book).permit(:title, :author_id, :publisher_id, :genre_id)
    end

    def set_book
      @book = Book.find(params[:id])
    end

end
