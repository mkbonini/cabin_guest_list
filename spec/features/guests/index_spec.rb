require 'rails_helper'

RSpec.describe 'the guests index page' do
    before(:each) do
        @cabin_1 = Cabin.create(title: 'cabin 1', co_ed: true, max_guest_count: 8)
        @cabin_2 = Cabin.create(title: 'cabin 2', co_ed: false, max_guest_count: 10)

        @guest_1 = @cabin_1.guests.create(first_name: 'Mike', last_name:'Bonini', invite: true, plus_ones: 1)
        @guest_2 = @cabin_1.guests.create(first_name: 'John', last_name:'Doe', invite: false, plus_ones: 0)
        @guest_3 = @cabin_2.guests.create(first_name: 'Jane', last_name:'Doe', invite: true, plus_ones: 0)
    end
    it 'displays the guests details' do
        visit "/guests"

        expect(page).to have_content(@guest_1.first_name)
        expect(page).to have_content(@guest_2.first_name)
        expect(page).to have_content(@guest_3.first_name)

        expect(page).to have_content(@guest_1.last_name)
        expect(page).to have_content(@guest_2.last_name)
        expect(page).to have_content(@guest_3.last_name)

        expect(page).to have_content(@guest_1.invite)
        expect(page).to have_content(@guest_2.invite)
        expect(page).to have_content(@guest_3.invite)

        expect(page).to have_content(@guest_1.plus_ones)
        expect(page).to have_content(@guest_2.plus_ones)
        expect(page).to have_content(@guest_3.plus_ones)
    end

    it 'has a link to the guest index' do
        visit "/guests"

        expect(page).to have_link("Guest index", :href =>"/guests")
    end

    it 'has a link to the cabin index' do
        visit "/guests"

        expect(page).to have_link("Cabin index", :href =>'/cabins')
    end
end