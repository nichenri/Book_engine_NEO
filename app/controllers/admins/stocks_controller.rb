class Admins::StocksController < AdminsController

  def create
    @book = Book.find(params[:book_id])
    ActiveRecord::Base.transaction do
      if @book.stocks.create!
      stock_id = Stock.last.id  
      reservation = @book.book_reservations.all.order("created_at").first
        if reservation
          StockReservation.create!(user_id: reservation.user_id, stock_id: stock_id, invalid_at: DateTime.now + 3.days)
          reservation.destroy!
        end
      end
    end
    redirect_to admins_top_index_path, notice: "#{sprintf("%08d", stock_id)}として登録されました"
  rescue => e
    p e
    redirect_to :back
  end

  def destroy
    Stock.find(params[:id]).destroy
    redirect_to admins_top_index_path
  end


  private

    def stock_params
      params.require(:stock).permit(:book_id)
    end

end
