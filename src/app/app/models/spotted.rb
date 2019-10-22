class Spotted < ApplicationRecord

    has_attached_file :image, :styles => { :original => "350x350>" }
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

    validates :content, presence: true, length: {minimum: 1}    

    belongs_to :college
    belongs_to :user
    has_many :like, dependent: :destroy
    has_many :comment, dependent: :destroy
end
