class StockReservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :stock
end
