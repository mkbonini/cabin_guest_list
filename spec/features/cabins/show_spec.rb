require 'rails_helper'

RSpec.describe 'the cabins show page' do
    before(:each) do
        @cabin_1 = Cabin.create(title: 'cabin 1', co_ed: true, max_guest_count: 8)
        @cabin_2 = Cabin.create(title: 'cabin 2', co_ed: false, max_guest_count: 10)

        @guest_1 = @cabin_1.guests.create(first_name: 'Mike', last_name:'Bonini', invite: true, plus_ones: 1)
        @guest_2 = @cabin_1.guests.create(first_name: 'John', last_name:'Aaronson', invite: false, plus_ones: 0)
        @guest_3 = @cabin_2.guests.create(first_name: 'Jane', last_name:'lastname', invite: true, plus_ones: 0)
    end
    it 'displays the cabin details' do
        visit "/cabins/#{@cabin_1.id}"

        expect(page).to have_content(@cabin_1.title)
        expect(page).to_not have_content(@cabin_2.title)

        expect(page).to have_content(@cabin_1.co_ed)
        expect(page).to_not have_content(@cabin_2.co_ed)

        expect(page).to have_content(@cabin_1.max_guest_count)
        expect(page).to_not have_content(@cabin_2.max_guest_count)
    end

    it 'displays the cabin occupancy' do 
        visit "/cabins/#{@cabin_1.id}"

        expect(page).to have_content("2/#{@cabin_1.max_guest_count}")
    end

    it 'has a link to the guest index' do
        visit "/cabins/#{@cabin_1.id}"

        expect(page).to have_link("Guest index", :href =>"/guests")
    end

    it 'has a link to the cabin index' do
        visit "/cabins/#{@cabin_1.id}"

        expect(page).to have_link("Cabin index", :href =>'/cabins')
    end

    it 'has a link to the cabins guest list' do
        visit "/cabins/#{@cabin_1.id}"
        click_on("Cabin Occupants")
        expect(current_path).to eq ("/cabins/#{@cabin_1.id}/guests")
    end
end