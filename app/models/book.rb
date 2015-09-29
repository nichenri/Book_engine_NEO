class Book < ActiveRecord::Base
  belongs_to :author
  belongs_to :publisher
  belongs_to :genre
  has_many :stocks, dependent: :destroy

  has_many :reviews, dependent: :destroy
  has_many :review_users, through: :reviews, :source => 'user'

  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_users, through: :bookmarks, :source => 'user'

  has_many :book_reservations
  has_many :reservation_users, through: :book_reservations, :source => 'user'



  def borrowing_records
    BorrowingHistory.where(stock_id: self.stocks).order("created_at DESC")
  end

  def borrowing_stocks
    Borrowing.where(stock_id: self.stocks)
  end

  def reserved_stocks
    StockReservation.where(stock_id: self.stocks)
  end


  def remaining_stocks
   borrowing_stock_ids = self.borrowing_stocks.pluck(:stock_id)
   reserved_stock_ids = self.reserved_stocks.pluck(:stock_id)
   remaining_stock_ids = self.stock_ids - borrowing_stock_ids - reserved_stock_ids
   stocks.where(id: remaining_stock_ids)
  end


end
