# As a visitor
# When I visit a parent show page
# Then I see a link to update the parent "Update Parent"
# When I click the link "Update Parent"
# Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
# When I fill out the form with updated information
# And I click the button to submit the form
# Then a `PATCH` request is sent to '/parents/:id',
# the parent's info is updated,
# and I am redirected to the Parent's Show page where I see the parent's updated info

require 'rails_helper'

RSpec.describe 'the cabins edit ' do
    it 'link to the edit page from cabin index' do
        cabin = Cabin.create(title: 'cabin name', co_ed: true, max_guest_count: 8)
        visit '/cabins'
        click_on("Edit #{cabin.title}")
        expect(current_path).to eq ("/cabins/#{cabin.id}/edit")
    end

    it 'can edit the cabin' do
        cabin = Cabin.create(title: 'cbin 1', co_ed: true, max_guest_count: 8)
        visit "/cabins"
        expect(page).to have_content("cbin 1")
        click_on("Edit cbin 1")
        fill_in 'title', with: "cabin name"
        click_on("Update Cabin")
        expect(current_path).to eq ("/cabins/#{cabin.id}")
        expect(page).to have_content('cabin name')
    end
end