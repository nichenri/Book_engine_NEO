class Admins::NewBooksController < Admins::ApplicationController

  def index
    @additions = Addition.all.order("created_at DESC")
    @addition_history = AdditionHistory.new
    @addition_history_search = AdditionHistory.search(params[:q])
    @addition_histories = @addition_history_search.result.order("created_at DESC")
  end

end
