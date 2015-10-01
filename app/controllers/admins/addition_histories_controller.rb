class Admins::AdditionHistoriesController < AdminsController

  def create
    ActiveRecord::Base.transaction do
      AdditionHistory.create!(addition_history_params)
      Addition.find_by(params[:addition_history][:addition_id]).destroy!
    end
    redirect_to admins_new_books_path, notice: "状態を変更しました"
  rescue => e
    p e
    redirect_to :back
  end

  private
    def addition_history_params
      params.require(:addition_history).permit(:user_id, :new_book_id, :status)
    end

end
