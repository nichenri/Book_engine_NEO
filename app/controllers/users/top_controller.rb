class Users::TopController < UsersController
  def index
    @user = User.includes(stock_reservations: [stock: [book: [:author, :publisher, :genre]]], book_reservations: [book: [:author, :publisher, :genre]], borrowings: [stock: [book: [:author, :publisher, :genre]]]).find(current_user.id) 
    @book_search = Book.search(params[:q])
    @books = @book_search.result.includes(:author, :publisher, :genre)
    @bookmarks = Bookmark.where(user_id: @user.id).includes(book: [:author, :publisher, :genre])
  end
end
