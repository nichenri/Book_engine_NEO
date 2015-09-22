class Users::BooksController < Users::ApplicationController
  before_action :set_book,  only: [:show]

  def show
    @user = current_user
    @book = Book.find(params[:id])
    @stocks = @book.stocks
    @reviews = @book.reviews.where(params[:id])
    @bookmarks = @book.bookmarks.where(params[:id])
    @user_bookmark = @bookmarks.find_by(user_id: current_user.id)
    @book_reservation = BookReservation.new
    @bookmark = Bookmark.new
    @review = Review.new
    @user_stock_reservations = StockReservation.where(user_id: current_user.id)
    @user_book_reservations = BookReservation.where(user_id: current_user.id)
  end

  private

    def book_params
      params.require(:book).permit(:title, :author_id, :publisher_id, :genre_id)
    end

    def set_book
      @book = Book.find(params[:id])
    end

end
