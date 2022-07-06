require 'faker'
FactoryBot.define do
  factory :group do |f|
    f.title { Faker::Name.title }
    f.location { Faker::Name.location }
  end
end