require 'rails_helper'

RSpec.describe 'Welcome page', type: :feature do
  describe 'when is visit /' do
    it 'and I select fire nation from the select field and click seach for members I should now be on the /search page', :vcr do
      visit '/'

      select 'Fire Nation', from: 'nation'
      click_button 'Search For Members'
      expect(current_path).to eq('/search')
    end
  end
end