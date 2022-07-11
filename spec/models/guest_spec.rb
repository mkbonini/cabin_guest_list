require 'rails_helper'

describe Guest, type: :model do
  describe "validations" do
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }
    # it { should validate_presence_of :invite }
    it { should validate_presence_of :plus_ones }
  end

  describe 'relationships' do
    it { should belong_to :cabin }
  end

  describe 'methods' do
    before(:each) do
      @cabin_1 = Cabin.create!(title: 'cabin 1', co_ed: true, max_guest_count: 8)
      @cabin_2 = Cabin.create!(title: 'cabin 2', co_ed: false, max_guest_count: 10)

      @guest_1 = @cabin_1.guests.create(first_name: 'Mike', last_name:'Bonini', invite: true, plus_ones: 1)
      @guest_2 = @cabin_1.guests.create(first_name: 'John', last_name:'Doe', invite: false, plus_ones: 0)
      @guest_3 = @cabin_2.guests.create(first_name: 'Jane', last_name:'Doe', invite: false, plus_ones: 0)
    end
    it 'invite only returns only guests with invite equal to true' do
      expect(Guest.invite_only.first).to eq (@guest_1)
    end
  end
end