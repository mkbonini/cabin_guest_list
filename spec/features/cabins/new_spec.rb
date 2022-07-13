require 'rails_helper'

RSpec.describe 'the cabins creation' do
    it 'link to the new page from cabin index' do
        visit '/cabins'

        click_on('New Cabin')
        expect(current_path).to eq ('/cabins/new')
    end

    it 'can create a new cabin' do
        visit '/cabins/new'

        fill_in('title', with: 'cabin title')
        fill_in('co_ed', with: true)
        fill_in('max_guest_count', with: 5)
        click_on('Create Cabin')
        
        expect(current_path).to eq ("/cabins") 
        expect(page).to have_content("cabin title")       
    end
end
