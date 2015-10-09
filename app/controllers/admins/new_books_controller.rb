class Admins::NewBooksController < AdminsController

  def index
    @addition_history = AdditionHistory.new
    @addition = Addition.new
    @addition_history_search = AdditionHistory.search(params[:q])
    @addition_search = Addition.search(params[:q])
    @addition_histories = @addition_history_search.result.includes(:user, :new_book).order("created_at DESC")
    @additions = @addition_search.result.includes(:user, :new_book).order("created_at DESC")
  end

end
