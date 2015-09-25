class Users::BookReservationsController < Users::ApplicationController

  before_action :set_book

  def create 
    @book_reservation = @book.book_reservations.new(user_id: current_user.id)
    if @book_reservation.save
      redirect_to users_book_path(@book.id)
    else 
      render 'new'
    end
  end

  def destroy
    @book_reservation = @user.book_reservation.find(params[:id])
    @book_reservation.destroy
    redirect_to users_book_path(@book.id)
  end

  private
    
    def set_book
      @book = Book.find(params[:book_id])
    end


end
