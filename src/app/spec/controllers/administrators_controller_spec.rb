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
                expect {
                    post :setting_manager, params: {user: {nickname: @user.nickname}, college: @college}
                    expect(response).to redirect_to(edit_college_path(@college))
                    expect(flash[:danger]).to match(/Usuário é o criador e administrador da página*/);
                }.to change(Administrator, :count).by(0)
            end

            it "failed to setting administrator page - user's nickname not found" do
                expect {
                    post :setting_manager, params: {user: {nickname: "nickname.teste"}, college: @college}
                    expect(response).to redirect_to(edit_college_path(@college))
                    expect(flash[:danger]).to match(/Nenhum usuário encontrado com esse nome*/);
                }.to change(Administrator, :count).by(0)
            end

            it "failed to setting administrator page - user is already a administrator" do
                expect {
                    @userAdministrator = FactoryBot.create(:user, email: "testeadm@hotmail.com", nickname: "useradministrator", first_name: "Adm", last_name: "Teste", password: "admteste", password_confirmation: "admteste", birth_date: "1998-10-25", city: "São Paulo", state: "SP", country: "Brasil")
                    post :setting_manager, params: {user: {nickname: @userAdministrator.nickname}, college: @college}
                    post :setting_manager, params: {user: {nickname: @userAdministrator.nickname}, college: @college}
                    expect(response).to redirect_to(edit_college_path(@college))
                    expect(flash[:danger]).to match(/Usuário já é administrador*/);
                }.to change(Administrator, :count).by(+1)
            end

            it "sucess to setting administrator page" do
                expect {
                    @userAdministrator = FactoryBot.create(:user, email: "testeadm@hotmail.com", nickname: "useradministrator", first_name: "Adm", last_name: "Teste", password: "admteste", password_confirmation: "admteste", birth_date: "1998-10-25", city: "São Paulo", state: "SP", country: "Brasil")
                    @userAdministrator.save
                    post :setting_manager, params: {user: {nickname: @userAdministrator.nickname}, college: @college}
                    expect(response).to redirect_to(edit_college_path(@college))
                    expect(flash[:success]).to match(/Usuário adicionado como administrador*/);
                }.to change(Administrator, :count).by(+1)
            end

            it "success to delete a administrator page" do
                expect {
                    @userAdministrator = FactoryBot.create(:user, email: "testeadm@hotmail.com", nickname: "useradministrator", first_name: "Adm", last_name: "Teste", password: "admteste", password_confirmation: "admteste", birth_date: "1998-10-25", city: "São Paulo", state: "SP", country: "Brasil")
                    @userAdministrator.save
                    post :setting_manager, params: {user: {nickname: @userAdministrator.nickname}, college: @college}
                    @adm = Administrator.find_by(user_id: @userAdministrator.id)
                    expect(response).to redirect_to(edit_college_path(@college))
                    expect(flash[:success]).to match(/Usuário adicionado como administrador*/);
                }.to change(Administrator, :count).by(+1)
                expect {
                    params = {:college_id => @college.id, :id => @adm.id}
                    delete :destroy, params: params
                }.to  change(Administrator, :count).by(-1)
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

            it "failed to delete administrator page - has a 302 status code" do
                session[:user_id] = @user.id
                expect {
                    @userAdministrator = FactoryBot.create(:user, email: "testeadm@hotmail.com", nickname: "useradministrator", first_name: "Adm", last_name: "Teste", password: "admteste", password_confirmation: "admteste", birth_date: "1998-10-25", city: "São Paulo", state: "SP", country: "Brasil")
                    @userAdministrator.save
                    post :setting_manager, params: {user: {nickname: @userAdministrator.nickname}, college: @college}
                    @adm = Administrator.find_by(user_id: @userAdministrator.id)
                    expect(response).to redirect_to(edit_college_path(@college))
                    expect(flash[:success]).to match(/Usuário adicionado como administrador*/);
                }.to change(Administrator, :count).by(+1)
                session[:user_id] = ""
                params = {:college_id => @college.id, :id => @adm.id}
                delete :destroy, params: params
                expect(response.status).to eq(302)

            end

        end

    end

end
