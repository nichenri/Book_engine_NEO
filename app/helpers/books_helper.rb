module BooksHelper

  def status(stock)
    if stock.borrowing
      return "貸出し中"
    else 
      if stock.stock_reservation
        return "取り置き中"
      else
        return "在庫あり"
      end
    end
  end

=begin
  def status_count(func_stocks, func_user, func_book)
    user_borrowing_count = 0
    user_stock_reservation_count = 0
    user_book_reservation_count = 0
    stock_count = 0
    empty_stock = 0

    func_stocks.each do |stock|
      if stock.borrowing_user == func_user
        user_borrowing_count += 1
        empty_stock = stock
        break
      else
        if stock.reservation_user == current_user
          empty_stock = stock
          break
        else
          if func_book.reservation_users.include?(:func_user)
          user_book_reservation_count += 1
          break
          else 
            if stock.borrowing || stock.stock_reservation
              stock_count += 1
            else
              empty_stock = stock
              break
            end
          end
        end
      end
    end
  end
=end

end
