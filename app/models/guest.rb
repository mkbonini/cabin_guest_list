class Guest < ApplicationRecord
    belongs_to :cabin

    validates_presence_of :first_name
    validates_presence_of :last_name
    validates :invite, inclusion: { in: [true, false] }
    validates_presence_of :plus_ones

    def self.invite_only
        @guests = Guest.where(invite: true)
    end
end