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
end
