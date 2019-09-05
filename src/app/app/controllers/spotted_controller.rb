class SpottedController < ApplicationController

    def new
        @spotted = Spotted.new
    end

    def create
        if @spotted.save
            flash[:sucess] = 'Spotted cadastrado com sucesso'
            redirect_to root_url
        else
            render 'new'
        end
    end
end
