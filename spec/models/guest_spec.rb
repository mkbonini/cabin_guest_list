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
end