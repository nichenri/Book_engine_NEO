class Users::StockReservationsController < Users::ApplicationController

  def create
    @book = Book.find(params[:book_id])
    @stock_reservation = StockReservation.new(stock_reservation_params)
    if @stock_reservation.save
      redirect_to users_book_path(@book.id)
    else
      render 'new'
    end
  end


  def destroy
    @book = Book.find(params[:book_id])
    @stock_reservation = StockReservation.find(params[:id])
    @stock_reservation.destroy
    redirect_to users_book_path(@book.id)
  end


  private

    def stock_reservation_params
      params.permit(:stock_id).merge(user_id: current_user.id, invalid_at: DateTime.now + 3.days)
    end

end
