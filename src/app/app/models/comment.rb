class Comment < ApplicationRecord

    validates :content, presence: true, length: {minimum: 1}

    belongs_to :spotted
    belongs_to :user
end
