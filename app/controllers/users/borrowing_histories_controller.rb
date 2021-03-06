class Users::BorrowingHistoriesController < UsersController

  def index
    user = current_user
    @borrowing_history_search = user.borrowing_histories.search(params[:q])
    @borrowing_histories = @borrowing_history_search.result.includes(stock: [book: [:author, :publisher, :genre]])
  end

end
