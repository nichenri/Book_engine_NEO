class Admins::BorrowingsController < AdminsController

  def index 
    @borrowings = Borrowing.all
    @stock_reservations = StockReservation.all
    @book_reservations = BookReservation.all
    @borrowing = Borrowing.new
    @borrowing_history = BorrowingHistory.new 
  end

  def create
    ActiveRecord::Base.transaction do
      Borrowing.create!(borrowing_params)
      StockReservation.find_by(params[:borrowing][:id]).destroy!
    end
    redirect_to admins_borrowings_path
  rescue => e
    p e
    redirect_to :back
  end

  private

    def borrowing_params
      params.require(:borrowing).permit(:user_id, :stock_id).merge(return_at: DateTime.now + 15.days)
    end

end
