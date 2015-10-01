class Users::BookmarksController < UsersController
  before_action :set_book, only: [:create, :destroy]


  def create
    @book.bookmarks.create(user_id: current_user.id)
    redirect_to users_book_path(@book.id), notice: "ブックマークに追加しました"
  end

  def destroy
    @book.bookmarks.find(params[:id]).destroy
    redirect_to users_book_path(@book.id), notice: "ブックマークから削除しました"
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

