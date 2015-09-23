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

  def link(func_user_stock_borrowing, func_user_stock_reservation, func_book, func_user_book_reservation, func_stocked_stock_ids, func_book_reservation, func_stock_reservation)
    if func_user_stock_borrowing 
      return "返却期限:" 
      return func_user_stock_borrowing.return_at.to_date 
    else 
      if func_user_stock_reservation 
      return "取り置き有効期限:", func_user_stock_reservation.invalid_at.to_date
      return link_to "予約取り消し", users_book_stock_stock_reservation_path(func_book.id, func_user_stock_reservation.stock_id, func_user_stock_reservation.id), method: :delete, data: {confirm: "Are you sure??"} 
      else 
        if func_user_book_reservation 
          return "現在予約中です。後日また連絡いたします。"
          return link_to "予約取り消し", users_book_book_reservation_path(func_book.id, func_user_book_reservation.id), method: :delete, data: {confirm: "Are you sure??"} 
        else 
          if func_stocked_stock_ids.empty? 
            return form_for func_book_reservation, url: users_book_book_reservations_path(func_book.id) do |f| 
              return f.submit :この本を予約する 
            end 
          else 
            return form_for func_stock_reservation, url: users_book_stock_stock_reservations_path(func_book.id, func_stocked_stock_ids[0]) do |f| 
              return f.submit :この本を予約する 
            end 
          end 
        end 
      end 
    end
  end

end
