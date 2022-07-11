class Meetup < ApplicationRecord
    belongs_to :group
    belongs_to :user
    has_many :users, through: :groups

    validates_associated :user
    validates :title, presence: true
    validates :location, presence: true
    validates :date, presence: true
    validates :time, presence: true
end
