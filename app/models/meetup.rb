class Meetup < ApplicationRecord
    belongs_to :group
    has_many :users

    validates_associated :user
    validates :location, presence: true
    validates :date, presence: true
end
