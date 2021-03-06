require 'rails_helper'
require 'ostruct'

RSpec.describe UsersController, type: :controller do
    describe "GET #new" do
        it "has a 200 status code" do
            get :new
            expect(response.status).to eq(200)
        end
    end

    describe "POST #create" do
        before(:each) do
            @user = FactoryBot.build(:user)
        end

        context "redirected to root_url" do
            it "without profile_picture" do
                post :create, params: {user: {email: @user.email, nickname: @user.nickname, first_name: @user.first_name, last_name: @user.last_name, password: @user.password, password_confirmation: @user.password_confirmation, birth_date: @user.birth_date, city: @user.city, state: @user.state, country: @user.country}}
    
                expect(response).to redirect_to(root_url)
            end

            it "with profile_picture" do
                @user_with_profile_picture = FactoryBot.build(:user)

                profile_picture = fixture_file_upload("#{Rails.root}/spec/fixtures/files/icon-384x384.png", 'image/png')

                post :create, params: {user: {email: @user_with_profile_picture.email, nickname: @user_with_profile_picture.nickname, first_name: @user_with_profile_picture.first_name, last_name: @user_with_profile_picture.last_name, password: @user_with_profile_picture.password, password_confirmation: @user_with_profile_picture.password_confirmation, birth_date: @user_with_profile_picture.birth_date, city: @user_with_profile_picture.city, state: @user_with_profile_picture.state, country: @user_with_profile_picture.country, profile_picture: profile_picture}}
    
                expect(response).to redirect_to(root_url)
            end
        end 

        it "rendered new" do
            post :create, params: {user: {email: "", nickname: @user.nickname, first_name: @user.first_name, last_name: @user.last_name, password: @user.password, password_confirmation: @user.password_confirmation, birth_date: @user.birth_date, city: @user.city, state: @user.state, country: @user.country}}

            expect(response).to render_template(:new)
        end
    end

    describe "POST #update" do
        before(:each) do
            @current_user = FactoryBot.create(:user)
        end

        context "user logged in" do
            before(:each) do
                session[:user_id] = @current_user.id
            end

            it "success updating user information" do
                put :update, params: {user: 
                    { first_name: @current_user.first_name,
                    last_name: @current_user.last_name,
                    nickname: @current_user.nickname,
                    birth_date: @current_user.birth_date,
                    email: @current_user.email,
                    password: @current_user.password,
                    password_confirmation: @current_user.password_confirmation,
                    country: @current_user.country,
                    state: @current_user.state,
                    city: @current_user.city },
                id: @current_user.id}

                expect(response).to redirect_to( user_path(@current_user) )
                expect(flash[:success]).to match("Dados atualizados.")
            end
            
            it "failed updating user information - render edit user" do
                put :update, params: {user: 
                    { first_name: @current_user.first_name,
                    last_name: @current_user.last_name,
                    nickname: @current_user.nickname,
                    birth_date: @current_user.birth_date,
                    email: @current_user.email,
                    password: "incorrect_password",
                    password_confirmation: @current_user.password_confirmation,
                    country: @current_user.country,
                    state: @current_user.state,
                    city: @current_user.city },
                id: @current_user.id}

                expect(response).to render_template(:edit)
            end
        end
        
        context "user not logged in" do
            it "has a 302 status code" do
                put :update, params: {user: 
                    { first_name: @current_user.first_name,
                    last_name: @current_user.last_name,
                    nickname: @current_user.nickname,
                    birth_date: @current_user.birth_date,
                    email: @current_user.email,
                    password: @current_user.password,
                    password_confirmation: @current_user.password_confirmation,
                    country: @current_user.country,
                    state: @current_user.state,
                    city: @current_user.city },
                id: @current_user.id}

                expect(response.status).to eq(302)                
            end
        end
    end
end
