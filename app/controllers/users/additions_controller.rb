class Users::AdditionsController < UsersController

  def destroy 
    ActiveRecord::Base.transaction do
      addition = Addition.find_by(params[:id])
      addition.new_book.destroy
      addition.destroy
    end
    redirect_to users_new_books_path
  end


end

