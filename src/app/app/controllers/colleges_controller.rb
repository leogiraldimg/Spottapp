class CollegesController < ApplicationController
    before_action :set_college, only: [:show]

    def new
        @college = College.new
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

        def set_college
            @college = College.find(params[:college_id])
        end
end
