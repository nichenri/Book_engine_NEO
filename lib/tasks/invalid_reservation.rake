namespace :invalid_reservation do
  desc "StockReservation中invalid_atを過ぎていれば削除"

  task :destroy_invalid_reservation => :environment do
    StockReservation.all.each do |stock_reservation|
      logger = Logger.new('log/invalid_reservation.log')
      logger.info "#{Time.now} -- destroy_invalid_reservation -- #{stock_reservation.to_yaml}"
      if stock_reservation.invalid_at > DateTime.now
        reservation = stock_reservation.stock.book.book_reservations.all.order("created_at").first
        if reservation 
          StockReservation.create(user_id: reservation.user_id, stock_id: stock_reservation.stock_id, invalid_at: DateTime.now + 3.days)
          reservation.destroy
        end
        stock_reservation.destroy
      end
    end
  end

end
