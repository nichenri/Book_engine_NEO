class Users::StockReservationsController < UsersController

  def create
    @book = Book.find(params[:book_id])
    StockReservation.create(stock_reservation_params)
    redirect_to users_book_path(@book.id)
  end


  def destroy
    @book = Book.find(params[:book_id])
    StockReservation.find(params[:id]).destroy
    redirect_to users_book_path(@book.id)
  end


  private

    def stock_reservation_params
      params.permit(:stock_id).merge(user_id: current_user.id, invalid_at: DateTime.now + 3.days)
    end

end
