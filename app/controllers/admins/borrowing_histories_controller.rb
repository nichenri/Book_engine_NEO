class Admins::BorrowingHistoriesController < Admins::ApplicationController

  def create
    @borrowing_history = BorrowingHistory.new(borrowing_history_params)
    @borrowing_history.save
    @borrowing = Borrowing.find(borrowing_params[:id])
    if book_reservation
      @stock_reservation = StockReservation.new(stock_reservation_params)
      @stock_reservation.save
      book_reservation.destroy
    end
    @borrowing.destroy
    redirect_to admins_borrowings_path
  end

    
  private

    def borrowing_history_params
      params.require(:borrowing_history).permit(:user_id, :stock_id, :borrowed_at)
    end

    def stock_reservation_params
      params.require(:borrowing_history).permit(:user_id, :stock_id).merge(invalid_at: DateTime.now + 3.days)
    end

    def borrowing_params
      params.require(:borrowing_history).permit(:id)
    end

    def book_reservation
      @borrowing.stock.book.book_reservations.all.order("created_at").first
    end


end
