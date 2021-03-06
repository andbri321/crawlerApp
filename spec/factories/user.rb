require 'factory_bot'

FactoryBot.define do
    factory :user do
      email { Faker::Internet.email }
      password  { Faker::Name.name }
    end
end