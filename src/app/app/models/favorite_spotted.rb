class FavoriteSpotted < ApplicationRecord
    belongs_to :spotted
    belongs_to :user
end
