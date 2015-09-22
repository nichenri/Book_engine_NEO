class Stock < ActiveRecord::Base
  belongs_to :book

  has_one :stock_reservation
  has_one :reservation_user, through: :stock_reservation, :source => 'user'

  has_one :borrowing
  has_one :borrowing_user, through: :borrowing, :source => 'user'

  has_many :borrowing_histories
  has_many :borrowing_history_users, through: :borrowing_histories, :source => 'user'
end
