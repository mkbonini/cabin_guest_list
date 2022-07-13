require 'rails_helper'

RSpec.describe 'the cabins creation' do
    it 'link to the new guest from cabin guest index' do
        cabin = Cabin.create(title: 'the cabin', co_ed: true, max_guest_count: 8)
        visit "/cabins/#{cabin.id}/guests"

        click_on('New Guest')
        expect(current_path).to eq ("/cabins/#{cabin.id}/guests/new")
    end

    it 'can create a new guest in a cabin' do
        cabin = Cabin.create(title: 'the cabin', co_ed: true, max_guest_count: 8)
        visit "/cabins/#{cabin.id}/guests/new"

        fill_in('first_name', with: 'new')
        fill_in('last_name', with: 'person')
        fill_in('invite', with: true)
        fill_in('plus_ones', with: 5)
        click_on('Create Guest')
        
        expect(current_path).to eq ("/cabins/#{cabin.id}/guests") 
        expect(page).to have_content("new person")       
    end
end
