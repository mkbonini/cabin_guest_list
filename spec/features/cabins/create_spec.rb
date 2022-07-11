require 'rails_helper'

RSpec.describe 'the cabins new page' do
    before(:each) do
        @cabin_1 = Cabin.create(title: 'cabin 1', co_ed: true, max_guest_count: 8)
        @cabin_2 = Cabin.create(title: 'cabin 2', co_ed: false, max_guest_count: 10)

        @guest_1 = @cabin_1.guests.create(first_name: 'Mike', last_name:'Bonini', invite: true, plus_ones: 1)
        @guest_2 = @cabin_1.guests.create(first_name: 'John', last_name:'Doe', invite: false, plus_ones: 0)
        @guest_3 = @cabin_2.guests.create(first_name: 'Jane', last_name:'Doe', invite: true, plus_ones: 0)
    end
    describe 'page display' do
    #     it 'displays the cabin names' do
    #         visit "/cabins/new"

    #         expect(page).to have_content(@cabin_1.title)
    #         expect(page).to have_content(@cabin_2.title)
    #     end

    #     it 'has a link to create a new cabin' do
    #         visit "/cabins/new"

    #         expect(page).to have_link("Create Cabin", :href =>'/cabins')
    #     end
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