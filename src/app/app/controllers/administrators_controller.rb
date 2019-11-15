class AdministratorsController < ApplicationController
    before_action :require_logged_in_user

    def setting_manager
        @college = College.find(params[:college])
        if !(user_found?)
            flash[:danger] = "Nenhum usuário encontrado com esse nome"
        else
            if (user_is_already_administrator?)
                flash[:danger] = "Usuário já é administrador"
            elsif (user_is_owner_of_the_page?)
                flash[:danger] = "Usuário é o criador e administrador da página"
            else
                @user = User.find_by(nickname: params[:user][:nickname])
                @college.administrator.create(user_id: @user.id)
                if (!college_is_already_favorite?)
                    @user.favorites << @college
                end
                flash[:success] = "Usuário adicionado como administrador"
            end
        end
        redirect_to edit_college_path(@college)
    end

    def show
        @college = College.find_by(id: params[:college_id])
        @administrators = Administrator.where(college_id: params[:college_id])
    end

    def destroy
        @administrador = Administrator.find_by(id: params[:id])
        @college = College.find_by(id: params[:college_id])
        @administrador.destroy
        notice = "O administrador foi excluído"
        flash[:success] =  notice
        redirect_to college_administrator_path(@college)
    end
    
    private

    def user_found?
        User.where(nickname: params[:user][:nickname]).exists?
    end

    def user_is_already_administrator?
        @user = User.find_by(nickname: params[:user][:nickname])
        Administrator.where(user_id: @user.id, college_id: @college.id).exists?
    end

    def user_is_owner_of_the_page?
        @user = User.find_by(nickname: params[:user][:nickname])
        College.where(user_id: @user.id, id: @college.id).exists?
    end

    def college_is_already_favorite?
        FavoriteCollege.where(user_id: @user.id, college_id: @college.id).exists?
    end

end
