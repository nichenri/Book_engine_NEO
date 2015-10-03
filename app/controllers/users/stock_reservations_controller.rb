class Users::StockReservationsController < UsersController

  def create
    @book = Book.find(params[:book_id])
    StockReservation.create(stock_reservation_params)
    redirect_to users_book_path(@book.id)
  end


  def destroy
    @book = Book.find(params[:book_id])
    ActiveRecord::Base.transaction do
      StockReservation.find(params[:id]).destroy!
      reservation = @book.book_reservations.all.order("created_at").first
      if reservation
        StockReservation.create!(user_id: reservation.user_id, stock_id: params[:stock_id], invalid_at: DateTime.now + 3.days)
      end
    end
    redirect_to users_book_path(@book.id)
  rescue => e
    p e
    redirect_to :back
  end


  private

  def stock_reservation_params
    params.permit(:stock_id).merge(user_id: current_user.id, invalid_at: DateTime.now + 3.days)
  end

end
