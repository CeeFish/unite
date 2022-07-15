require 'faker'
FactoryBot.define do
  factory :meetup do |f|
    f.title { Faker::Name.title }
    f.location { Faker::Name.location }
    f.user { Faker::Internet.user }
    f.group { Faker::Name.group }
    f.date { Faker::Name.date }
    f.time { Faker::Name.time }
  end
end