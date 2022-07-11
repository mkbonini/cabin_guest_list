require 'rails_helper'

RSpec.describe 'the cabins creation' do
    it 'link to the new page from artist index' do
        visit '/cabins'

        click_on('New Cabin')
        expect(current_path).to eq ('/cabins/new')
    end

    it 'can create a new artist' do
        visit '/cabins/new'

        fill_in('title', with: 'cabin title')
        fill_in('co_ed', with: true)
        fill_in('max_guest_count', with: 5)
        click_on('Create Cabin')
        
        # new_cabin_id = Cabin.last.id
        expect(current_path).to eq ("/cabins") 
        expect(page).to have_content("cabin title")       
    end
end
# As a visitor
# When I visit the Parent Index page
# Then I see a link to create a new Parent record, "New Parent"
# When I click this link
# Then I am taken to '/parents/new' where I  see a form for a new parent record
# When I fill out the form with a new parent's attributes:
# And I click the button "Create Parent" to submit the form
# Then a `POST` request is sent to the '/parents' route,
# a new parent record is created,
# and I am redirected to the Parent Index page where I see the new Parent displayed.