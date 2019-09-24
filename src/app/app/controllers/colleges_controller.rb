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

    private 
        def college_params
            params.require(:college).permit(:name, :initials, :city, :state, :country, :unit, :user_id)
        end
end
