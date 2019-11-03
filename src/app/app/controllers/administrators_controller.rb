class AdministratorsController < ApplicationController
    
    def setting_manager
        @college = College.find(params[:college])
        if !(user_found?)
            flash[:notice] = "Nenhum usuário encontrado com esse nome"
        else
            if (user_is_already_administrator?)
                flash[:notice] = "Usuário já é administrador"
            else
                @user = User.find_by(nickname: params[:user][:nickname])
                @college.administrator.create(user_id: @user.id)
                flash[:notice] = "Usuário adicionado como administrador"
            end
        end
        redirect_to edit_college_path(@college)
    end
    
    private

    def user_found?
        User.where(nickname: params[:user][:nickname]).exists?
    end

    def user_is_already_administrator?
        @user = User.find_by(nickname: params[:user][:nickname])
        Administrator.where(user_id: @user.id, college_id: @college.id).exists?
    end

end
