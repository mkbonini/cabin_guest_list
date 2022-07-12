require 'rails_helper'

describe Cabin, type: :model do
  describe "validations" do
    it { should validate_presence_of :title }
    # it { should validate_presence_of :co_ed }
    it { should validate_presence_of :max_guest_count }
  end

  describe 'relationships' do
    it { should have_many :guests }
  end
#   As a visitor
#   When I visit the parent index,
#   I see that records are ordered by most recently created first
#   And next to each of the records I see when it was created
  describe 'methods' do
    before(:each) do
        @cabin_1 = Cabin.create!(title: 'cabin 1', co_ed: true, max_guest_count: 8)
        @cabin_2 = Cabin.create!(title: 'cabin 2', co_ed: false, max_guest_count: 10)

        @guest_1 = @cabin_1.guests.create(first_name: 'Mike', last_name:'Bonini', invite: true, plus_ones: 1)
        @guest_2 = @cabin_1.guests.create(first_name: 'John', last_name:'Aaronson', invite: false, plus_ones: 0)
        @guest_3 = @cabin_2.guests.create(first_name: 'Jane', last_name:'lastname', invite: true, plus_ones: 0)
    end

    it 'should return cabins most recently created first' do
        expect(Cabin.newest_first.first).to eq(@cabin_2)#[@cabin_2,@cabin]
    end

    it 'should return the count of guests in a cabin' do 
        expect(@cabin_1.guest_count).to eq(2)
    end

    it 'should be able to sort guests by last name' do
        expect(@cabin_1.sort_guests.first).to eq(@guest_2)
    end
  end

end

