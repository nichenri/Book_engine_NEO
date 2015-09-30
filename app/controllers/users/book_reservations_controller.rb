class Users::BookReservationsController < UsersController

  before_action :set_book

  def create 
    @book.book_reservations.create(user_id: current_user.id)
    redirect_to users_book_path(@book.id)
  end

  def destroy
    @user.book_reservation.find(params[:id]).destroy
    redirect_to users_book_path(@book.id)
  end

  private
    
    def set_book
      @book = Book.find(params[:book_id])
    end


end
