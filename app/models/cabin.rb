class Cabin < ApplicationRecord
    has_many :guests

    validates_presence_of :title
    # validates_presence_of :co_ed, inclusion: { in: [ true, false ] }
    validates_presence_of :max_guest_count

    def self.newest_first
        Cabin.all.order("created_at DESC")
    end

    def guest_count
        self.guests.count
    end

    # def self.sort_guests(id)
    #     #  binding.pry
    #     guests = Cabin.find(id).guests.order("last_name")
    # end

    def sort_guests
        #  binding.pry
        guests = self.guests.order("last_name")
    end
end