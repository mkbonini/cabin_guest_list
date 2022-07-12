require 'rails_helper'

RSpec.describe 'the cabins edit ' do
    it 'link to the edit page from cabin index' do
        cabin = Cabin.create(title: 'cabin name', co_ed: true, max_guest_count: 8)
        visit '/cabins'
        click_on("Edit #{cabin.title}")
        expect(current_path).to eq ("/cabins/#{cabin.id}/edit")
    end

    it 'can edit the cabin from index' do
        cabin = Cabin.create(title: 'cbin 1', co_ed: true, max_guest_count: 8)
        visit "/cabins"
        expect(page).to have_content("cbin 1")
        click_on("Edit cbin 1")
        fill_in 'title', with: "cabin name"
        click_on("Update Cabin")
        expect(current_path).to eq ("/cabins/#{cabin.id}")
        expect(page).to have_content('cabin name')
    end

    it 'can edit the cabin from show page' do
        cabin = Cabin.create(title: 'cbin 1', co_ed: true, max_guest_count: 8)
        visit "/cabins/#{cabin.id}"
        expect(page).to have_content("cbin 1")
        click_on("Edit cbin 1")
        fill_in 'title', with: "cabin name"
        click_on("Update Cabin")
        expect(current_path).to eq ("/cabins/#{cabin.id}")
        expect(page).to have_content('cabin name')
    end
end