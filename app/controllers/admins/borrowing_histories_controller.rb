class Admins::BorrowingHistoriesController < Admins::ApplicationController

  def index
    @borrowing_history_search = BorrowingHistory.search(params[:q])
    @borrowing_histories = @borrowing_history_search.result
  end


end
