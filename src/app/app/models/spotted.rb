class Spotted < ApplicationRecord
    validates :image, presence: false
    validates :content, presence: true, length: {minimum: 1}    

    belongs_to :college
    belongs_to :user
    has_many :like, dependent: :destroy
    has_many :comment, dependent: :destroy
    has_many :favorite_spotteds, dependent: :destroy
    has_many :favorited_by, through: :favorite_spotteds, source: :user, dependent: :destroy
end
