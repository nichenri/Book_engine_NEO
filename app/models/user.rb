class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :reviews
  has_many :review_books, through: :reviews, :source => 'book' 

  has_many :bookmarks
  has_many :bookmark_books, through: :bookmarks, :source => 'book'

  has_many :additions
  has_many :new_books, through: :additions

  has_many :borrowings
  has_many :borrowing_stocks, through: :borrowings, :source => 'stock'

  has_many :borrowing_histories
  has_many :borrowing_history_stocks, through: :borrowing_histories, :source => 'stock'

  has_many :stock_reservations
  has_many :reservation_stocks, through: :stock_reservations, :source => 'stock'

  has_many :book_reservations
  has_many :reservation_books, through: :book_reservations, :source => 'book'

end
