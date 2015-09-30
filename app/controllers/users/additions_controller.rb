class Users::AdditionsController < UsersController

  def destroy 
    addition = Addition.find_by(params[:id])
    addition.new_book.destroy
    addition.destroy
    redirect_to users_new_books_path
  end


end

