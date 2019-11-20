class ApplicationController < ActionController::Base
    include SessionsHelper

    private
        def require_logged_in_user
            unless user_signed_in?
            flash[:danger] = 'Área restrita. Por Favor, realize o login'
            redirect_to entrar_path
        end
    end
    
    def already_favorited(college_id)
        FavoriteCollege.exists?(user_id: current_user.id, college_id: college_id)
    end
    helper_method :already_favorited

    def already_favorited_spotted(spotted_id)
        FavoriteSpotted.exists?(user_id: current_user.id, spotted_id: spotted_id)
    end
    helper_method :already_favorited_spotted

    def already_favorited_any_spotted
        FavoriteSpotted.exists?(user_id: current_user.id)
    end
    helper_method :already_favorited_any_spotted

    def show_favorites_spotteds
        @favorite_spotteds = FavoriteSpotted.where(user_id: current_user.id)
    end
    helper_method :show_favorites_spotteds

    def isPageAdmin(college_id)
        if College.exists?(user_id: current_user.id, id: college_id)  
            return true

        elsif Administrator.exists?(user_id: current_user.id, college_id: college_id)
            return true
        
        else
            return false
        end
    end
    helper_method :isPageAdmin

    def isUserAdminOfPage(college_id, user_id)
        if College.exists?(user_id: user_id, id: college_id)  
            return true

        elsif Administrator.exists?(user_id: user_id, college_id: college_id)
            return true
        
        else
            return false
        end
    end
    helper_method :isUserAdminOfPage
end
