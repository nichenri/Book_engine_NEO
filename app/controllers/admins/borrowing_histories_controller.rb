class Admins::BorrowingHistoriesController < AdminsController

  def index
    @borrowing_history_search = BorrowingHistory.search(params[:q])
    @borrowing_histories = @borrowing_history_search.result
  end

  def create
    ActiveRecord::Base.transaction do
      BorrowingHistory.create!(borrowing_history_params)
      @borrowing = Borrowing.find(params[:borrowing_history][:id])
      if book_reservation
        @stock_reservation = book_reservation.user.stock_reservations.create!(stock_reservation_params)
        book_reservation.destroy!
      end
      @borrowing.destroy!
    end
    redirect_to admins_borrowings_path
  rescue => e
    p e
    redirect_to :back
  end

    
  private

    def borrowing_history_params
      params.require(:borrowing_history).permit(:user_id, :stock_id, :borrowed_at)
    end

    def stock_reservation_params
      params.require(:borrowing_history).permit(:stock_id).merge(invalid_at: DateTime.now + 3.days)
    end

    def book_reservation
      @borrowing.stock.book.book_reservations.all.order("created_at").first
    end

end
