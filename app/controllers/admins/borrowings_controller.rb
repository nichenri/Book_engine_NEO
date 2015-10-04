class Admins::BorrowingsController < AdminsController

  def index 
    @stock_reservation = StockReservation.new
    @borrowing = Borrowing.new
    @stock_reservation_search = StockReservation.search(params[:q])
    @borrowing_search = Borrowing.search(params[:q])
    @borrowings = @borrowing_search.result.includes(:user, stock: [ book: [:author, :publisher, :genre]])
    @stock_reservations = @stock_reservation_search.result.includes(:user, stock: [ book: [:author, :publisher, :genre]])
    @book_reservations = BookReservation.all.includes(:user, book: [:author, :publisher, :genre])
    @borrowing_history = BorrowingHistory.new 
  end

  def create
    ActiveRecord::Base.transaction do
      StockReservation.find(params[:borrowing][:id]).destroy!
      Borrowing.create!(borrowing_params)
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
