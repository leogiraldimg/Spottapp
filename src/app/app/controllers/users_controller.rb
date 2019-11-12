class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save

            if params[:see_fav_pages]
                sign_in(@user)

                redirect_to per_area_path
            else 
                flash[:success] = 'Usuário cadastrado com sucesso'
                redirect_to root_url
            end
        else
            render 'new'
        end
    end

    private
        def user_params
            params.require(:user).permit(:email, :nickname, :first_name, :last_name, :password, :password_confirmation, :birth_date, :city, :state, :country)
        end
end
