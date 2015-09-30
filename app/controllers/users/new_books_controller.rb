class Users::NewBooksController < UsersController

  def index 
    @user = User.includes(additions: [:new_book], addition_histories: [:new_book]).find(current_user)
    @new_book = NewBook.new
  end

  def create
    @new_book = NewBook.new(new_book_params)
    @new_book.additions.build(user_id: current_user.id)
    @new_book.save
    redirect_to users_new_books_path
  end




  private 
    def new_book_params
      params.require(:new_book).permit(:title, :author, :publisher, :genre_id)
    end

end
