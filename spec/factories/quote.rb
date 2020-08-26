require 'factory_bot'

FactoryBot.define do
    factory :quote do
      name { Faker::Name.name }
      author  { Faker::Name.name }
      author_about  { Faker::Internet.url }
    end
end

def quote_with_tags(tags_count: 3)
  FactoryBot.create(:quote) do |quote|
    FactoryBot.create_list(:tag, tags_count, quote: quote)
  end
end