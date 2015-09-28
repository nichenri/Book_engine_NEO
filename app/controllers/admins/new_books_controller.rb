class Admins::NewBooksController < Admins::ApplicationController

  def index
    @addition_search = Addition.search(params[:q])
    @additions = @addition_search.result
    @addition_history = AdditionHistory.new
    @addition_history_search = AdditionHistory.search(params[:q])
    @addition_histories = @addition_history_search.result
  end

end
