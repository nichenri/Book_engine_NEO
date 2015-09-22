class Admins::BooksController < Admins::ApplicationController
  before_action :set_book,  only: [:edit, :update, :destroy]
  before_action :set_admin, only: [:create, :update, :destroy]

  def show
    @book = Book.find(params[:id])
    @stocks = @book.stocks
    @reviews = @book.reviews.where(params[:id])
    @bookmarks = @book.bookmarks.where(params[:id])
  end

  def new
    @book = Book.new
  end

  def create 
    @book = Book.new(book_params)
    if @book.save 
      redirect_to admins_top_index_path(@admin.id)
    else 
      render 'new'
    end
  end

  def edit
  end

  def update
    if @book.update(book_params) 
      redirect_to admins_top_index_path(@admin.id)
    else 
      render 'edit'
    end
  end

  def destroy
    @book.destroy
    redirect_to admins_top_index_path(@admin.id)
  end

  private

  def set_admin
    @admin = current_admin
  end

    def book_params
      params.require(:book).permit(:title, :author_id, :publisher_id, :genre_id)
    end

    def set_book
      @book = Book.find(params[:id])
    end

end
