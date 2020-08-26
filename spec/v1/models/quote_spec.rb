require 'rails_helper'

RSpec.describe Quote, type: :model do
    it 'is valid with name' do
        quote = create(:quote)
        expect(quote).to be_valid
    end

    describe 'Validates' do
        it { is_expected.to validate_presence_of(:name) }
    end

    describe 'Instance Methods' do
        it 'return a quote with name' do
            quote = create(:quote)
            expect(quote.quote).to eq("#{quote.name}")
        end
    end
end