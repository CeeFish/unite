class Group < ApplicationRecord
  # belongs_to :user
  has_many :users
    
  validates :title, presence: true
  validates :location, presence: true
end
