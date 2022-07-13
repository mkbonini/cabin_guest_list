
require 'rails_helper'

RSpec.describe 'the cabins index page' do
    before(:each) do
        @cabin_1 = Cabin.create(title: 'cabin 1', co_ed: true, max_guest_count: 8)
        @cabin_2 = Cabin.create(title: 'cabin 2', co_ed: false, max_guest_count: 10)

        @guest_1 = @cabin_1.guests.create(first_name: 'Mike', last_name:'Bonini', invite: true, plus_ones: 4)
        @guest_2 = @cabin_1.guests.create(first_name: 'John', last_name:'Aaronson', invite: false, plus_ones: 2)
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

    it 'can specifiy a number of plus ones that guests must have to display' do
        visit "/cabins/#{@cabin_1.id}/guests"

        fill_in 'plus_one_count', with: 3
        click_on("filter guests")# with more than #{page.plus_one_count} of plus ones")
        # expect(current_path).to eq ("/cabins/#{@cabin_1.id}/guests")
        expect(page).to have_content(@guest_1.first_name)
        expect(page).to_not have_content(@guest_2.first_name)
    end

    # As a visitor
    # When I visit the Parent's children Index Page
    # I see a form that allows me to input a number value
    # When I input a number value and click the submit button that reads 'Only return records with more than `number` of `column_name`'
    # Then I am brought back to the current index page with only the records that meet that threshold shown.
end