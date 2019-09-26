class FavoriteCollegesController < ApplicationController
    before_action :require_logged_in_user

    def show
        @favorite_colleges = FavoriteCollege.where(user_id: current_user.id)
    end
    
end