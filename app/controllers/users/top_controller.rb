class Users::TopController < UsersController
  def index
    @user = current_user
    @book_search = Book.search(params[:q])
    @books = @book_search.result
    @bookmarks = Bookmark.where(user_id: @user.id)
    @stock_reservations = @user.stock_reservations.all
    @book_reservations = @user.book_reservations.all
    @borrowings = @user.borrowings.all
  end
end
