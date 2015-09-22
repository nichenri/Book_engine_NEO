class Genre < ActiveRecord::Base
  has_many :books, dependent: :destroy
  has_many :new_books, dependent: :destroy
end
