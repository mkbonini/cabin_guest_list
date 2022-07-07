class Cabin < ApplicationRecord
    has_many :guests

    validates_presence_of :title
    # validates_presence_of :co_ed, inclusion: { in: [ true, false ] }
    validates_presence_of :max_guest_count
end