class CollegesController < ApplicationController
    before_action :require_logged_in_user

    def new
        @college = College.new
        @college.user = current_user
    end

    def show
        @college = College.find(params[:id])
    end

    def create
        @college = College.new(college_params)
        @college.user = current_user
        if @college.save
            flash[:sucess] = 'Faculdade cadastrada com sucesso'
            redirect_to root_url
        else
            render 'new'
        end
    end

    def favorite
        @college = College.find(params[:id])
        type = params[:type]
        if type == "favorite"
            current_user.favorites << @college
            redirect_back fallback_location: root_path, notice: "Você favoritou #{@college.name}"

        elsif type == "unfavorite"
            current_user.favorites.delete(@college)
            redirect_back fallback_location: root_path, notice: "Você desfavoritou #{@college.name}"
    
        else
            redirect_back fallback_location: root_path, notice: 'Nada aconteceu.'
        end
    end

    private 
        def college_params
            params.require(:college).permit(:name, :initials, :city, :state, :country, :unit, :user_id)
        end
end
