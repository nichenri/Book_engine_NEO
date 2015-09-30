class Admins::NewBooksController < AdminsController

  def index
    @additions = Addition.all.order("created_at DESC").includes(:user, :new_book)
    @addition_history = AdditionHistory.new
    @addition_history_search = AdditionHistory.search(params[:q])
    @addition_histories = @addition_history_search.result.includes(:user, :new_book).order("created_at DESC")
  end

end
