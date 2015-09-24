module BooksHelper

  def status(stock)
    if stock.borrowing
      "貸出し中"
    else 
      if stock.stock_reservation
        "取り置き中"
      else
        "在庫あり"
      end
    end
  end

  def status_select(user, stocks, book, book_reservation, stock_reservation)
    if user.stock_borrow(stocks) 
      "返却期限: #{user.stock_borrow(stocks).return_at.to_date}" 
    else 
      if user.stock_reserv(stocks) 
        "取り置き有効期限: #{user.stock_reserv(stocks).invalid_at.to_date}"
        link_to "予約取り消し", users_book_stock_stock_reservation_path(book.id, user.stock_reserv(stocks).stock_id, user.stock_reserv(stocks).id), method: :delete, data: {confirm: "Are you sure??"} 
      else 
        if user.book_reserv(book) 
          "現在予約中です。後日また連絡いたします。"
          link_to "予約取り消し", users_book_book_reservation_path(book.id, user.book_reserv(book).id), method: :delete, data: {confirm: "Are you sure??"} 
        else 
          unless book.remaining_stock 
            form_for book_reservation, url: users_book_book_reservations_path(book.id) do |f| 
              f.submit :この本を予約する 
            end 
          else 
            form_for stock_reservation, url: users_book_stock_stock_reservations_path(book.id, book.remaining_stock.id) do |f| 
              f.submit :この本を予約する 
            end 
          end 
        end 
      end 
    end 
  end

end
