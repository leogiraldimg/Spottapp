class SpottedsController < ApplicationController
    before_action :set_college, only: [:index, :new]
    
    def index
        @spotteds = @college.spotteds
    end

    def new
        @spotted = Spotted.new
        @spotted.user = current_user
    end

    def show
        @spotted = Spotted.find(params[:id])
    end

    def create
        @spotted = Spotted.new(spotted_params)
        @spotted.user = current_user
        @spotted.college = College.find(params[:college_id])
        @spotted.college_spotted_counter = Spotted.where(college_id: @spotted.college_id).count + 1
        if @spotted.save
            flash[:sucess] = 'Spotted cadastrado com sucesso'
            redirect_to college_spotteds_path
        else
            render 'new'
        end
    end

    private 
        def spotted_params
            params.require(:spotted).permit(:content)
        end

        def set_user_creator
            user = User.find_by(email: params[:session][:email].downcase)
        end

        def set_college
            @college = College.find(params[:college_id])
        end
end