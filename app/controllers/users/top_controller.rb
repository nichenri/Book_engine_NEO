class Users::TopController < UsersController
  def index
    @user = current_user
    @book_search = Book.search(params[:q])
    @books = @book_search.result.includes(:author, :publisher, :genre)
  end
end
