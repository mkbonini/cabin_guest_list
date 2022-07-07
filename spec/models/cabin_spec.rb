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

end

