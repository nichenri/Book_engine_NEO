class Users::BooksController < Users::ApplicationController
  before_action :set_book,  only: [:show]

  def show
    @user = current_user
    @book = Book.find(params[:id])
    @bookmark = Bookmark.new
    @user_bookmark = @book.bookmarks.find_by(user_id: @user.id)
    @review = Review.new
    @reviews = @book.reviews
    @book_reservation = BookReservation.new
    @stock_reservation = StockReservation.new
    @stocks = @book.stocks
  end


  private

    def book_params
      params.require(:book).permit(:title, :author_id, :publisher_id, :genre_id)
    end

    def set_book
      @book = Book.find(params[:id])
    end

end
