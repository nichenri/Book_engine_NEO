class NewBook < ActiveRecord::Base
  has_many :additions, dependent: :destroy
  accepts_nested_attributes_for :additions
  has_many :users, through: :additions, dependent: :destroy

  has_many :addition_histories
  has_many :users, through: :addition_histories
end
