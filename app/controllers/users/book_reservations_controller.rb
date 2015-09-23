class Users::BookReservationsController < Users::ApplicationController

  def create 
    @book = Book.find(params[:book_id])
    @book_reservation = @book.book_reservations.new(user_id: current_user.id)
    if @book_reservation.save
      redirect_to users_book_path(@book.id)
    else 
      render 'new'
    end
  end

  def destroy
    @book = Book.find(params[:book_id])
    @book_reservation = BookReservation.find(params[:id])
    @book_reservation.destroy
    redirect_to users_book_path(@book.id)
  end

end
