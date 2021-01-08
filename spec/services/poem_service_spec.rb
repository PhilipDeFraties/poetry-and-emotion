require 'rails_helper'

RSpec.describe PoemService do
  context '#poems_with_analysis' do
    it "returns appropriate data" do
      service = PoemService.new

      results = service.poems_with_analysis('Emily')
      expect(results).to be_an(Array)
      expect(results.count).to eq(10)

      first_poem = results.first
      expect(first_poem).to have_attributes(author: 'Emily Dickinson')
      expect(first_poem).to have_attributes(title: 'Not at Home to Callers')
      expect(first_poem).to have_attributes(tones: ['Joy'])
    end
  end
end
