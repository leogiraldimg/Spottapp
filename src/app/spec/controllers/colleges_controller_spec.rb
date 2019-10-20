require 'rails_helper'

RSpec.describe CollegesController, type: :controller do
    describe "GET #index" do
        before(:each) do
            @current_user = FactoryBot.create(:user)
        end

        context "user logged in" do
            before(:each) do
                session[:user_id] = @current_user.id
            end

            it "has a 200 status code" do
                get :index
                expect(response.status).to eq(200)
            end
        end
        
        context "user not logged in" do
            it "has a 302 status code" do
                get :index
                expect(response.status).to eq(302)
            end
        end
        
    end
    
    describe "GET #new" do
        before(:each) do
            @current_user = FactoryBot.create(:user)
        end
        
        context "user logged in" do
            before(:each) do
                session[:user_id] = @current_user.id
            end

            it "has a 200 status code" do
                get :new
                expect(response.status).to eq(200)
            end
        end

        context "user not logged in" do
            it "has a 302 status code" do
                get :new
                expect(response.status).to eq(302)
            end
        end
    end

    describe "POST #create" do
        before(:each) do
            @current_user = FactoryBot.create(:user)
            @college_factory = FactoryBot.create(:college)
        end

        context "user logged in" do
            before(:each) do
                session[:user_id] = @current_user.id
            end

            it "redirected to root_url" do
                post :create, params: {college: {name: @college_factory.name, initials: @college_factory.initials, city: @college_factory.city, state: @college_factory.state, country: @college_factory.country, unit: @college_factory.unit, user_id: @college_factory.user.id, background_color: @college_factory.background_color, font_family: @college_factory.font_family, background_image: @college_factory.background_image, font_color: @college_factory.font_color, request_to_participate: @college_factory.request_to_participate, admin_approves_spotted: @college_factory.admin_approves_spotted}}

                expect(response).to redirect_to(root_url)
            end

            it "rendered new" do
                post :create, params: {college: {name: @college_factory.name, initials: @college_factory.initials, city: @college_factory.city, state: @college_factory.state, country: @college_factory.country, unit: 'ExampleExampleExample', user_id: @college_factory.user.id, background_color: @college_factory.background_color, font_family: @college_factory.font_family, background_image: @college_factory.background_image, font_color: @college_factory.font_color, request_to_participate: @college_factory.request_to_participate, admin_approves_spotted: @college_factory.admin_approves_spotted}}

                expect(response).to render_template(:new)
            end
        end

        context "user not logged in" do
            it "has a 302 status code" do
                post :create, params: {college: {name: @college_factory.name, initials: @college_factory.initials, city: @college_factory.city, state: @college_factory.state, country: @college_factory.country, unit: @college_factory.unit, user_id: @college_factory.user.id, background_color: @college_factory.background_color, font_family: @college_factory.font_family, background_image: @college_factory.background_image, font_color: @college_factory.font_color, request_to_participate: @college_factory.request_to_participate, admin_approves_spotted: @college_factory.admin_approves_spotted}}

                expect(response.status).to eq(302)
            end
        end
    end

    describe "GET #show" do
        before(:each) do
            @current_user = FactoryBot.create(:user)
            @college_factory = FactoryBot.create(:college)
            @college_factory.save
        end

        context "user logged in" do
            before(:each) do
                session[:user_id] = @current_user.id
            end

            it "has a 200 status code" do
                get :show, params: {id: @college_factory.id}

                expect(response.status).to eq(200)
            end
        end

        context "user not logged in" do
            it "has a 302 status code" do
                get :show, params: {id: @college_factory.id}

                expect(response.status).to eq(302)
            end
        end        
    end

    describe "POST #favorite" do
        before(:each) do
            @current_user = FactoryBot.create(:user)
            @college_factory = FactoryBot.create(:college)
            @college_factory.save
        end
        
        context "user logged in" do
            before(:each) do
                session[:user_id] = @current_user.id
            end

            it "notice that you have favorited" do
                post :favorite, params: {id: @college_factory.id, type: "favorite"}

                expect(response).to redirect_to(colleges_path)
                expect(flash[:notice]).to match(/Você favoritou*/)
            end

            it "notice that you have unfavorited" do
                post :favorite, params: {id: @college_factory.id, type: "unfavorite"}

                expect(response).to redirect_to(colleges_path)
                expect(flash[:notice]).to match(/Você desfavoritou*/)
            end

            it "notice that you have done nothing" do
                post :favorite, params: {id: @college_factory.id, type: ""}

                expect(response).to redirect_to(colleges_path)
                expect(flash[:notice]).to match(/Nada aconteceu*/)
            end
        end

        context "user not logged in" do
            it "notice that you have favorited - has a 302 status code" do
                post :favorite, params: {id: @college_factory.id, type: "favorite"}

                expect(response.status).to eq(302)
            end

            it "notice that you have unfavorited - has a 302 status code" do
                post :favorite, params: {id: @college_factory.id, type: "unfavorite"}

                expect(response.status).to eq(302)
            end

            it "notice that you have done nothing - has a 302 status code" do
                post :favorite, params: {id: @college_factory.id, type: ""}

                expect(response.status).to eq(302)
            end
        end
    end

    describe "POST #update" do
        before(:each) do
            @current_user = FactoryBot.create(:user)
            @college_factory = FactoryBot.create(:college)
            @college_factory.save
        end

        context "user logged in" do
            before(:each) do
                session[:user_id] = @current_user.id
            end

            it "success updating college settings" do
                put :update, params: {college: {name: @college_factory.name, initials: @college_factory.initials, city: @college_factory.city, state: @college_factory.state, country: @college_factory.country, unit: @college_factory.unit, user_id: @college_factory.user.id, background_color: @college_factory.background_color, font_family: @college_factory.font_family, background_image: @college_factory.background_image, font_color: @college_factory.font_color, request_to_participate: @college_factory.request_to_participate, admin_approves_spotted: @college_factory.admin_approves_spotted}, id: @college_factory.id}

                expect(response).to redirect_to(edit_college_path(@college_factory))
                expect(flash[:success]).to match(/Dados atualizados*/)
            end
            
            it "failed updating college settings - render edit college" do
                put :update, params: {college: {name: @college_factory.name, initials: @college_factory.initials, city: @college_factory.city, state: @college_factory.state, country: @college_factory.country, unit: @college_factory.unit, user_id: @college_factory.user.id, background_color: "12", font_family: @college_factory.font_family, background_image: @college_factory.background_image, font_color: @college_factory.font_color, request_to_participate: @college_factory.request_to_participate, admin_approves_spotted: @college_factory.admin_approves_spotted}, id: @college_factory.id}

                expect(response).to render_template(:edit)
            end
        end
        
        context "user not logged in" do
            it "has a 302 status code" do
                put :update, params: {college: {name: @college_factory.name, initials: @college_factory.initials, city: @college_factory.city, state: @college_factory.state, country: @college_factory.country, unit: @college_factory.unit, user_id: @college_factory.user.id, background_color: @college_factory.background_color, font_family: @college_factory.font_family, background_image: @college_factory.background_image, font_color: @college_factory.font_color, request_to_participate: @college_factory.request_to_participate, admin_approves_spotted: @college_factory.admin_approves_spotted}, id: @college_factory.id}

                expect(response.status).to eq(302)                
            end
        end
    end
end
