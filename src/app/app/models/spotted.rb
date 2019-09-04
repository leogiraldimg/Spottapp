class Spotted < ApplicationRecord

    validates :content, presence: true, length: {minimum: 1}

    belongs_to :college
    belongs_to :user
end
