
require 'rails_helper'

RSpec.describe 'the cabins index page' do
    before(:each) do
        @cabin_1 = Cabin.create(title: 'cabin 1', co_ed: true, max_guest_count: 8)
        @cabin_2 = Cabin.create(title: 'cabin 2', co_ed: false, max_guest_count: 10)

        @guest_1 = @cabin_1.guests.create(first_name: 'Mike', last_name:'Bonini', invite: true, plus_ones: 1)
        @guest_2 = @cabin_1.guests.create(first_name: 'John', last_name:'Aaronson', invite: false, plus_ones: 0)
        @guest_3 = @cabin_2.guests.create(first_name: 'Jane', last_name:'lastname', invite: true, plus_ones: 0)
    end

    it 'displays the cabin names' do
        visit "/cabins/#{@cabin_1.id}/guests"

        expect(page).to have_content(@guest_1.first_name)
        expect(page).to have_content(@guest_2.first_name)
        expect(page).to_not have_content(@guest_3.first_name)
    end
    
    it 'has a link to the guest index' do
        visit "/cabins/#{@cabin_1.id}/guests"

        expect(page).to have_link("Guest index", :href =>"/guests")
    end

    it 'has a link to the cabin index' do
        visit "/cabins/#{@cabin_1.id}/guests"

        expect(page).to have_link("Cabin index", :href =>'/cabins')
    end

    it 'has a link to sort guests alphabetically' do
        visit "/cabins/#{@cabin_1.id}/guests"

        click_on('sort guests by last name')

        expect(page.text.index(@guest_2.last_name)).to be < page.text.index(@guest_1.last_name)
    end

# As a visitor
# When I visit the Parent's children Index Page
# Then I see a link to sort children in alphabetical order
# When I click on the link
# I'm taken back to the Parent's children Index Page where I see all of the parent's children in alphabetical order
end