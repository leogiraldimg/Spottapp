class CollegesController < ApplicationController

    def new
        @college = College.new
    end

    def show
        @college = College.find(params[:id])
    end

    def create
        @college = College.new(college_params)
        if @college.save
            flash[:sucess] = 'Faculdade cadastrada com sucesso'
            redirect_to root_url
        else
            render 'new'
        end
    end

    private 
        def college_params
            params.require(:college).permit(:name, :initials, :city, :state, :country, :unit)
        end
end
