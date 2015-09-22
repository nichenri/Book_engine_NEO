class Users::NewBooksController < Users::ApplicationController

  def new
    @new_book = NewBook.new
  end

  def create
    @new_book = NewBook.new(new_book_params)
    @new_book.additions.build(user_id: current_user.id)
    @new_book.save
    redirect_to new_users_new_book_path
  end


  private 
    def new_book_params
      params.require(:new_book).permit(:title, :author, :publisher, :genre_id)
    end

end
