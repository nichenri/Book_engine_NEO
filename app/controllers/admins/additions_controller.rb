class Admins::AdditionsController < Admins::ApplicationController

  def update
    @admin = current_admin
    @addition = Addition.find(params[:id])
    if @addition.update(params.require(:addition).permit(:addition_status_id))
      redirect_to admins_new_books_path(@admin.id)
    else
      render 'edit'
    end
  end

end

