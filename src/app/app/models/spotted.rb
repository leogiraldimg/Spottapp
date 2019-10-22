class Spotted < ApplicationRecord

    has_attached_file :image,
        :styles => {
            :thumb => "60x60>",
            :small => "140x140>",
            :medium =>   "310x310>",
            :large => "500x500>"
        }
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

    validates :content, presence: true, length: {minimum: 1}    

    belongs_to :college
    belongs_to :user
    has_many :like, dependent: :destroy
    has_many :comment, dependent: :destroy
end
