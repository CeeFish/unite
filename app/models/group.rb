class Group < ApplicationRecord
  # belongs_to :user
  has_many :user
  
  validates_associated :user
  validates :title, presence: true
  validates :location, presence: true
end
