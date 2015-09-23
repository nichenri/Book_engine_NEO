class Users::BooksController < Users::ApplicationController
  before_action :set_book,  only: [:show]

  def show
    @user = current_user
    @book = Book.find(params[:id])
    @bookmark = Bookmark.new
    @bookmarks = @book.bookmarks.where(params[:id])
    @user_bookmark = @bookmarks.find_by(user_id: current_user.id)
    @review = Review.new
    @reviews = @book.reviews.where(params[:id])
    @book_reservation = BookReservation.new
    @stock_reservation = StockReservation.new

    @stocks = @book.stocks
    @stock_ids = @stocks.pluck(:id)
    @user_stock_reservation = stock_common(@user.stock_reservations) 
    @user_stock_borrowing = stock_common(@user.borrowings)
    @user_book_reservation = @user.book_reservations.find_by(book_id: params[:id]) 
    @stocked_stock_ids = @stock_ids - not_stocked_stock_ids
  end

  private


    def not_stocked_stock_ids
      common_stock_ids(Borrowing) + common_stock_ids(StockReservation)
    end

    def common_stock_ids(loans)
      @stock_ids & loans.pluck(:stock_id)
    end

    def stock_common(loans)
      loans.find_by(stock_id: common_stock_ids(loans))
    end

    def book_params
      params.require(:book).permit(:title, :author_id, :publisher_id, :genre_id)
    end

    def set_book
      @book = Book.find(params[:id])
    end

end
