require 'rails_helper'

RSpec.describe 'the guests show page' do
    before(:each) do
        @cabin_1 = Cabin.create(title: 'cabin 1', co_ed: true, max_guest_count: 8)
        @cabin_2 = Cabin.create(title: 'cabin 2', co_ed: false, max_guest_count: 10)

        @guest_1 = @cabin_1.guests.create(first_name: 'Mike', last_name:'Bonini', invite: true, plus_ones: 1)
        @guest_2 = @cabin_1.guests.create(first_name: 'John', last_name:'Aaronson', invite: false, plus_ones: 0)
        @guest_3 = @cabin_2.guests.create(first_name: 'Jane', last_name:'lastname', invite: true, plus_ones: 0)
    end
    it 'displays the guest details' do
        visit "/guests/#{@guest_1.id}"
        expect(page).to have_content(@guest_1.first_name)
        expect(page).to_not have_content(@guest_2.first_name)
        expect(page).to_not have_content(@guest_3.first_name)

        expect(page).to have_content(@guest_1.last_name)
        expect(page).to_not have_content(@guest_2.last_name)
        expect(page).to_not have_content(@guest_3.last_name)

        expect(page).to have_content(@guest_1.invite)
        # expect(page).to_not have_content(@guest_2.invite)
        # expect(page).to_not have_content(@guest_3.invite)

        expect(page).to have_content(@guest_1.plus_ones)
        expect(page).to_not have_content(@guest_2.plus_ones)
        expect(page).to_not have_content(@guest_3.plus_ones)
    end

    it 'has a link to the guest index' do
        visit "/guests/#{@guest_1.id}"

        expect(page).to have_link("Guest index", :href =>"/guests")
    end

    it 'has a link to the cabin index' do
        visit "/guests/#{@guest_1.id}"

        expect(page).to have_link("Cabin index", :href =>'/cabins')
    end

    it 'has a link to delete the guest' do
        @guest_4 = @cabin_2.guests.create(first_name: 'should be deleted', last_name:'guest', invite: true, plus_ones: 1)
        visit "/guests/#{@guest_4.id}"

        click_on("Delete #{@guest_4.first_name} #{@guest_4.last_name}")

        expect(current_path).to eq ("/guests")
        expect(page).to_not have_content(@guest_4.first_name)
    end
end