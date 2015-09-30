class Admins::StocksController < AdminsController

  def create
    Book.find(params[:book_id]).stocks.create
    redirect_to admins_top_index_path
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
