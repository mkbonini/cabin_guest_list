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
    #   @cabin = Cabin.create!(title: 'cabin 1', co_ed: true, max_guest_count: 8)
    #   @cabin_2 = Cabin.create!(title: 'cabin 2', co_ed: false, max_guest_count: 10)

    #   it 'should return cabins most recently created first' do
    #       Cabin.all.should == [@cabin_2,@cabin]
    #   end
  end

end

