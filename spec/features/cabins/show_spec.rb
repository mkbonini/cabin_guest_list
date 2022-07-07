require 'rails_helper'

RSpec.describe 'the cabins show page' do
    before(:each) do
        @cabin_1 = Cabin.create(title: 'cabin 1', co_ed: true, max_guest_count: 8)
        @cabin_2 = Cabin.create(title: 'cabin 2', co_ed: false, max_guest_count: 10)

        @guest_1 = @cabin_1.guests.create(first_name: 'Mike', last_name:'Bonini', invite: true, plus_ones: 1)
        @guest_2 = @cabin_1.guests.create(first_name: 'John', last_name:'Doe', invite: false, plus_ones: 0)
        @guest_3 = @cabin_2.guests.create(first_name: 'Jane', last_name:'Doe', invite: true, plus_ones: 0)
    end
    it 'displays the cabin names' do
        visit "/cabins/#{@cabin_1.id}"

        expect(page).to have_content(@cabin_1.title)
        expect(page).to_not have_content(@cabin_2.title)

        expect(page).to have_content(@cabin_1.co_ed)
        expect(page).to_not have_content(@cabin_2.co_ed)

        expect(page).to have_content(@cabin_1.max_guest_count)
        expect(page).to_not have_content(@cabin_2.max_guest_count)
    end
end