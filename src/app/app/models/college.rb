class College < ApplicationRecord
    validates :name, presence:true, length: { maximum:65 }
    validates :initials, length: { maximum:8 }
    validates :city, presence:true, length: { maximum:30 }
    validates :state, presence:true, length: { maximum:30 }
    validates :country, presence:true, length: { maximum:30 }
    validates :unit, length: { maximum:20 }

    has_many :spotteds
end
