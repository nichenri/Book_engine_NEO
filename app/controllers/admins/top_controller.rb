class Admins::TopController < AdminsController
  def index
    @book_search = Book.search(params[:q])
    @books = @book_search.result.includes(:author, :publisher, :genre)
    @stock = Stock.new
  end
end
