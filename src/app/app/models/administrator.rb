class Administrator < ApplicationRecord
    belongs_to :user
    belongs_to :college
end
