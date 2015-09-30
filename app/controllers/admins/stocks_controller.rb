class Admins::StocksController < AdminsController

  def create
    @book = Book.find(params[:book_id])
    @stock = @book.stocks.new
    if @stock.save 
      redirect_to admins_top_index_path
    else 
      render 'new'
    end
  end

  def destroy
    @stock = Stock.find(params[:id])
    @stock.destroy
    redirect_to admins_top_index_path
  end


  private

    def stock_params
      params.require(:stock).permit(:book_id)
    end

end
