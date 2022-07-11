require 'rails_helper'

RSpec.describe 'the guests edit ' do
    it 'link to the edit page from cabin index' do
        cabin = Cabin.create(title: 'another cabin name', co_ed: true, max_guest_count: 8)
        guest = cabin.guests.create(first_name: 'mark', last_name:'rober', invite: true, plus_ones: 1)
        visit "/guests/#{guest.id}"
        click_on("Edit #{guest.first_name} #{guest.last_name}")
        expect(current_path).to eq ("/guests/#{guest.id}/edit")
    end

    it 'can edit the guest' do
        cabin = Cabin.create(title: 'cbin 1', co_ed: true, max_guest_count: 8)
        guest = cabin.guests.create(first_name: 'mak', last_name:'rober', invite: true, plus_ones: 1)
        visit "/guests/#{guest.id}"
        expect(page).to have_content("mak")
        click_on("Edit #{guest.first_name} #{guest.last_name}")
        fill_in 'first_name', with: "mark"
        click_on("Update Guest")
        expect(current_path).to eq ("/guests/#{guest.id}")
        expect(page).to have_content('mark')
    end
end

# As a visitor
# When I visit a Child Show page
# Then I see a link to update that Child "Update Child"
# When I click the link
# I am taken to '/child_table_name/:id/edit' where I see a form to edit the child's attributes:
# When I click the button to submit the form "Update Child"
# Then a `PATCH` request is sent to '/child_table_name/:id',
# the child's data is updated,
# and I am redirected to the Child Show page where I see the Child's updated information