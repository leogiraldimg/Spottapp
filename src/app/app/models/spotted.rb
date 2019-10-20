class Spotted < ApplicationRecord

    has_many_attached :images

    validates :content, presence: true, length: {minimum: 1}    

    belongs_to :college
    belongs_to :user
    has_many :like, dependent: :destroy
    has_many :comment, dependent: :destroy
end
