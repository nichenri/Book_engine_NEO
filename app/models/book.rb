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


  def remaining_stock
   borrowing_stock_ids = Borrowing.where(stock_id: self.stocks).pluck(:stock_id)
   reserved_stock_ids = StockReservation.where(stock_id: self.stocks).pluck(:stock_id)
   self.stocks.where.not(id: borrowing_stock_ids + reserved_stock_ids).first
  end


end
