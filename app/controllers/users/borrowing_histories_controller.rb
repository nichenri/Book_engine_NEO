class Users::BorrowingHistoriesController < Users::ApplicationController

  def index
    user = current_user
    @borrowing_history_search = user.borrowing_histories.search(params[:q])
    @borrowing_histories = @borrowing_history_search.result
  end

end
