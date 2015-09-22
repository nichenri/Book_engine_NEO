class Users::BookmarksController < Users::ApplicationController
  before_action :set_book, only: [:create, :destroy]


  def create
    @bookmark = @book.bookmarks.new(user_id: current_user.id)
    if @bookmark.save
      redirect_to users_book_path(@book.id)
    else 
      render 'new'
    end
  end

  def destroy
    @bookmark = @book.bookmarks.find(params[:id])
    @bookmark.destroy
    redirect_to users_book_path(@bookmark.book_id)
  end


  private 

    def set_book
      @book = Book.find(params[:book_id])
    end

    def bookmark_params
      @user = current_user
      params.require(:bookmark).merge(user_id: @user.id)
    end

end 

