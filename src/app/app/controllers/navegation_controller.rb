class NavegationController < ApplicationController

    def show
        @colleges = College.all
    end

end