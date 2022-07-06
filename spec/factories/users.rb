require 'faker'
FactoryBot.define do
  factory :customer do |f|
    f.name { Faker::Name.name }
    f.email { Faker::Internet.email }
    f.password { Faker::Internet.password } #need to add any uniqueness or length requirements
  end
end
