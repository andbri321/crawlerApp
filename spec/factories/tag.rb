require 'factory_bot'

FactoryBot.define do
    factory :tag do
      name { Faker::Internet.email }
    end
end