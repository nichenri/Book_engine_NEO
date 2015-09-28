class Admins::TopController < Admins::ApplicationController
  def index
    @book_search = Book.search(params[:q])
    @books = @book_search.result
    @stock = Stock.new
  end
end
