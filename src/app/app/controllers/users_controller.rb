class UsersController < ApplicationController
    before_action :require_logged_in_user, only: [:edit, :update]
    
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        puts user_params[:profile_picture]

        if (user_params[:profile_picture])
            img_file = user_params[:profile_picture].tempfile.open.read.force_encoding(Encoding::UTF_8)
            img_file_type = user_params[:profile_picture].content_type
            @user.profile_picture = Base64.encode64(img_file)
            @user.profile_picture_content_type = img_file_type
        end

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

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            flash[:success] = 'Dados atualizados.'
            sign_in @user
            redirect_to user_path(@user)
        else
            render 'edit'
        end
    end

    private
        def user_params
            params.require(:user).permit(:email, :nickname, :first_name, :last_name, :password, :password_confirmation, :birth_date, :city, :state, :country, :profile_picture)
        end
end
