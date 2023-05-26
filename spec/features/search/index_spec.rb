require 'rails_helper'

RSpec.describe 'search index', type: :feature do
  describe 'when I visit the search index' do
    it 'I see the name of the nation I have searched members for, the total members, name and photo, ', :vcr do
      visit '/'
      select 'Fire Nation', from: 'nation'
      click_button 'Search For Members'

      expect(page).to have_content("Total Members: 97")
      expect(page).to have_content("Chan (Fire Nation admiral)")
      expect(page).to have_content("Allies: Ozai")
      expect(page).to have_content("Enemies: Earth Kingdom")
      expect(page).to have_content("Affiliation(s): Fire Nation Navy")

      expect(page).to have_selector("img[src*='https://vignette.wikia.nocookie.net/avatar/images']")
    end
  end
end