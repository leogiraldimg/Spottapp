class CollegesController < ApplicationController
    before_action :require_logged_in_user
    before_action :set_college, only: [:edit, :update] 

    def new
        @college = College.new
        @college.user = current_user
    end

    def show
        @college = College.find(params[:id])
    end

    def index
        @colleges = College.all
    end

    def create
        @college = College.new(college_params)
        @college.user = current_user
        if @college.save
            current_user.favorites << @college
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
            notice = "Você favoritou #{@college.name}"
            flash[:success] = notice
            redirect_back fallback_location: colleges_path

        elsif type == "unfavorite"
            current_user.favorites.delete(@college)
            notice = "Você desfavoritou #{@college.name}"
            flash[:success] = notice
            redirect_back fallback_location: colleges_path
        
        elsif type == "admin"
            notice = "Você é o administrador de #{@college.name} e não pode desfavoritá-la."
            flash[:danger] = notice
            redirect_back fallback_location: colleges_path

        else
            redirect_back fallback_location: colleges_path, notice: 'Nada aconteceu.'
        end
    end

    def update
        if @college.update(college_params)
            flash[:success] = 'Dados atualizados'
            redirect_to edit_college_path(@college)
        else
            render 'edit'
        end
    end

    def destroy
        @college = College.find(params[:id])
        @college.destroy
        notice = "A página do(a) #{@college.name} foi deletada."
        flash[:success] = notice
        redirect_to favorite_colleges_path
    end

    private 
        def college_params
            params.require(:college).permit(:name, :initials, :city, :state, :country, :unit, :user_id, :background_color, :font_family, :background_image, :font_color, :request_to_participate, :admin_approves_spotted)
        end

        def set_college
            @college = College.find(params[:id])
        end
end
