require 'rails_helper'

RSpec.describe 'the cabins index page' do
    before(:each) do
        @cabin_1 = Cabin.create(title: 'cabin 1', co_ed: true, max_guest_count: 8)
        @cabin_2 = Cabin.create(title: 'cabin 2', co_ed: false, max_guest_count: 10)

        @guest_1 = @cabin_1.guests.create(first_name: 'Mike', last_name:'Bonini', invite: true, plus_ones: 1)
        @guest_2 = @cabin_1.guests.create(first_name: 'John', last_name:'Aaronson', invite: false, plus_ones: 0)
        @guest_3 = @cabin_2.guests.create(first_name: 'Jane', last_name:'lastname', invite: true, plus_ones: 0)
    end
    describe 'page display' do
        it 'displays the cabin names' do
            visit "/cabins"

            expect(page).to have_content(@cabin_1.title)
            expect(page).to have_content(@cabin_2.title)
        end

        it 'displays the cabin created_at field' do
            visit "/cabins"

            expect(page).to have_content(@cabin_1.created_at)
            expect(page).to have_content(@cabin_2.created_at)
        end

        it 'displays the cabins most recent first' do
            visit "/cabins"

            first = @cabin_2.title
            second = @cabin_1.title

            # expect(first).to appear_before(second)

            expect(page.text.index(first)).to be < page.text.index(second)
        end

        it 'has a link to the guest index' do
            visit "/cabins"

            expect(page).to have_link("Guest index", :href =>"/guests")
        end

        it 'has a link to the cabin index' do
            visit "/cabins"

            expect(page).to have_link("Cabin index", :href =>'/cabins')
        end
    end
end

#     describe 'CRUD' do
#         # it 'has a link to create a new cabin' do
#         #     visit "/cabins"

#         #     expect(page).to have_link("new cabin", :href =>'/cabins/new')
#         # end
#     end
