class College < ApplicationRecord
    VALID_HEX_COLOR = /\A#?(?:[A-F0-9]{3}){1,2}\z/i

    validates :name, presence:true, length: { maximum:65 }
    validates :initials, length: { maximum:8 }
    validates :city, presence:true, length: { maximum:30 }
    validates :state, presence:true, length: { maximum:2 }
    validates :country, presence:true, length: { maximum:30 }
    validates :unit, length: { maximum:20 }
    validates :background_color, format: { with: VALID_HEX_COLOR }, :allow_nil => true
    validates :font_family, length: { maximum: 30 }
    validates :background_image, url: {no_local: true, allow_blank: true}
    validates :font_color, format: { with: VALID_HEX_COLOR }, :allow_nil => true
    validates :request_to_participate, presence: false
    validates :admin_approves_spotted, presence: false

    belongs_to :user

    has_many :spotteds, dependent: :destroy
    has_many :favorite_colleges, dependent: :destroy
    has_many :favorited_by, through: :favorite_colleges, source: :user, dependent: :destroy
    has_many :administrator
    has_many :college_whitelist
  
end
