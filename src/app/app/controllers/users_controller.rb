class UsersController < ApplicationController
    before_action :require_logged_in_user, only: [:edit, :update]
    
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)

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

        if params[:user][:profile_picture]
            img_file = params[:user][:profile_picture].tempfile.open.read.force_encoding(Encoding::UTF_8)
            img_file_type = params[:user][:profile_picture].content_type
            params[:user][:profile_picture] = Base64.encode64(img_file)
            params[:user][:profile_picture_content_type] = img_file_type
        elsif @user.profile_picture
            params[:user][:profile_picture] = @user.profile_picture
            params[:user][:profile_picture_content_type] = @user.profile_picture_content_type
        end

        if @user.update(user_params)
            flash[:success] = 'Dados atualizados.'
            sign_in @user
            redirect_to user_path(@user)
        else
            render 'edit'
        end
    end

    def change_menu_preference
        type = params[:type]
        if type == "circle"
            current_user.update_column(:menu_preference, "circle")
            redirect_back fallback_location: root_url

        elsif type == "list"
            current_user.update_column(:menu_preference, "list")
            redirect_back fallback_location: root_url

        else
            redirect_back fallback_location: root_url, notice: 'Nada aconteceu.'
        end
      end

    private
        def user_params
            params.require(:user).permit(:email, :nickname, :first_name, :last_name, :password, :password_confirmation, :birth_date, :city, :state, :country, :profile_picture, :profile_picture_content_type)
        end
end
