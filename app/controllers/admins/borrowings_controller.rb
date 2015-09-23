class Admins::BorrowingsController < Admins::ApplicationController

  def index 
    @borrowings = Borrowing.all
    @stock_reservations = StockReservation.all
    @book_reservations = BookReservation.all
    @borrowing = Borrowing.new
    @borrowing_history = BorrowingHistory.new 
  end

  def create
    @borrowing = Borrowing.new(borrowing_params)
    @borrowing.save
    @stock_reservation = StockReservation.find(stock_reservation_params[:id])
    @stock_reservation.destroy
    redirect_to admins_borrowings_path
  end


  private

    def borrowing_params
      params.require(:borrowing).permit(:user_id, :stock_id).merge(return_at: DateTime.now + 15.days)
    end

    def stock_reservation_params
      params.require(:borrowing).permit(:id)
    end



end
