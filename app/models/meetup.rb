class Meetup < ApplicationRecord
    belongs_to :group
    has_many :user

    validates :location, presence: true
end
