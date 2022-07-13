require 'rails_helper'

describe Cabin, type: :model do
  Guest.destroy_all
  Cabin.destroy_all

  describe "validations" do
    it { should validate_presence_of :title }
    it { should allow_value(%w(true false)).for(:co_ed) }
    it { should validate_presence_of :max_guest_count }
  end

  describe 'relationships' do
    it { should have_many :guests }
  end

  describe 'methods' do
    before(:each) do
        @cabin_1 = Cabin.create!(title: 'cabin 1', co_ed: true, max_guest_count: 8)
        @cabin_2 = Cabin.create!(title: 'cabin 2', co_ed: false, max_guest_count: 10)

        @guest_1 = @cabin_1.guests.create(first_name: 'Mike', last_name:'Bonini', invite: true, plus_ones: 2)
        @guest_2 = @cabin_1.guests.create(first_name: 'John', last_name:'Aaronson', invite: false, plus_ones: 1)
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

    it 'should be able to filter by plus one count' do
        expect(@cabin_1.get_guest_list(1).first).to eq(@guest_1)
    end
  end
end

