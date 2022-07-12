class Meetup < ApplicationRecord
    belongs_to :group
    has_many :users, through: :groups

    validates_associated :user
    validates :title, presence: true
    validates :location, presence: true
    validates :date, presence: true
    validates :time, presence: true
    validates :group, presence: true
end
