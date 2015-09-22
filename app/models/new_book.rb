class NewBook < ActiveRecord::Base
  has_many :additions, dependent: :destroy
  accepts_nested_attributes_for :additions
  has_many :users, through: :applications, dependent: :destroy
  belongs_to :genre
end
