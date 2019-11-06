require 'rails_helper'

RSpec.describe AdministratorsController, type: :controller do
    describe "POST #setting_manager" do
        before(:each) do
            @user = FactoryBot.create(:user)
            @college = FactoryBot.create(:college) 
            @user.save
            @college.save
        end

        context "user logged in" do
            before(:each) do
                session[:user_id] = @user.id
            end


            it "failed to setting administrator page - user is already owner" do
                post :setting_manager, params: {user: {nickname: @user.nickname}, college: @college}
                expect(response).to redirect_to(edit_college_path(@college))
                expect(flash[:notice]).to match(/Usuário é o criador e administrador da página*/);
            end

            it "failed to setting administrator page - user's nickname not found" do
                post :setting_manager, params: {user: {nickname: "nickname.teste"}, college: @college}
                expect(response).to redirect_to(edit_college_path(@college))
                expect(flash[:notice]).to match(/Nenhum usuário encontrado com esse nome*/);
            end

            it "failed to setting administrator page - user is already a administrator" do
                @userAdministrator = FactoryBot.create(:user, email: "testeadm@hotmail.com", nickname: "useradministrator", first_name: "Adm", last_name: "Teste", password: "admteste", password_confirmation: "admteste", birth_date: "1998-10-25", city: "São Paulo", state: "SP", country: "Brasil")
                post :setting_manager, params: {user: {nickname: @userAdministrator.nickname}, college: @college}
                post :setting_manager, params: {user: {nickname: @userAdministrator.nickname}, college: @college}
                expect(response).to redirect_to(edit_college_path(@college))
                expect(flash[:notice]).to match(/Usuário já é administrador*/);
            end

            it "sucess to setting administrator page" do
                @userAdministrator = FactoryBot.create(:user, email: "testeadm@hotmail.com", nickname: "useradministrator", first_name: "Adm", last_name: "Teste", password: "admteste", password_confirmation: "admteste", birth_date: "1998-10-25", city: "São Paulo", state: "SP", country: "Brasil")
                post :setting_manager, params: {user: {nickname: @userAdministrator.nickname}, college: @college}
                expect(response).to redirect_to(edit_college_path(@college))
                expect(flash[:notice]).to match(/Usuário adicionado como administrador*/);
            end
        end

        context "user not logged in" do
            it "failed to setting administrator page - user is already owner - has a 302 status code" do
                post :setting_manager, params: {user: {nickname: @user.nickname}, college: @college}
                expect(response.status).to eq(302)
            end

            it "failed to setting administrator page - user's nickname not found  - has a 302 status code" do
                post :setting_manager, params: {user: {nickname: "nickname.teste"}, college: @college}
                expect(response.status).to eq(302)
            end

            it "failed to setting administrator page - user is already a administrator  - has a 302 status code" do
                @userAdministrator = FactoryBot.create(:user, email: "testeadm@hotmail.com", nickname: "useradministrator", first_name: "Adm", last_name: "Teste", password: "admteste", password_confirmation: "admteste", birth_date: "1998-10-25", city: "São Paulo", state: "SP", country: "Brasil")
                post :setting_manager, params: {user: {nickname: @userAdministrator.nickname}, college: @college}
                post :setting_manager, params: {user: {nickname: @userAdministrator.nickname}, college: @college}
                expect(response.status).to eq(302)
            end

            it "sucess to setting administrator page  - has a 302 status code" do
                @userAdministrator = FactoryBot.create(:user, email: "testeadm@hotmail.com", nickname: "useradministrator", first_name: "Adm", last_name: "Teste", password: "admteste", password_confirmation: "admteste", birth_date: "1998-10-25", city: "São Paulo", state: "SP", country: "Brasil")
                post :setting_manager, params: {user: {nickname: @userAdministrator.nickname}, college: @college}
                expect(response.status).to eq(302)
            end
        end

    end

end
