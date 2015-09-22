class Addition < ActiveRecord::Base
  belongs_to :user
  belongs_to :new_book
  belongs_to :addition_status
end
