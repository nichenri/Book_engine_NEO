class Users::BorrowingsController < UsersController

  def index
    @user = User.includes(stock_reservations: [stock: [book: [:author, :publisher, :genre]]], book_reservations: [book: [:author, :publisher, :genre]], borrowings: [stock: [book: [:author, :publisher, :genre]]]).find(current_user.id) 
  end

end
