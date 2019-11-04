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
            @college = FactoryBot.create(:college)
        end

        context "user logged in" do
            before(:each) do
                session[:user_id] = @current_user.id
            end

            it "redirected to root_url" do
                post :create, params: {college: {name: @college.name, initials: @college.initials, city: @college.city, state: @college.state, country: @college.country, unit: @college.unit, user_id: @college.user.id, background_color: @college.background_color, font_family: @college.font_family, background_image: @college.background_image, font_color: @college.font_color, request_to_participate: @college.request_to_participate, admin_approves_spotted: @college.admin_approves_spotted}}

                expect(response).to redirect_to(root_url)
            end

            it "rendered new" do
                post :create, params: {college: {name: @college.name, initials: @college.initials, city: @college.city, state: @college.state, country: @college.country, unit: 'ExampleExampleExample', user_id: @college.user.id, background_color: @college.background_color, font_family: @college.font_family, background_image: @college.background_image, font_color: @college.font_color, request_to_participate: @college.request_to_participate, admin_approves_spotted: @college.admin_approves_spotted}}

                expect(response).to render_template(:new)
            end
        end

        context "user not logged in" do
            it "has a 302 status code" do
                post :create, params: {college: {name: @college.name, initials: @college.initials, city: @college.city, state: @college.state, country: @college.country, unit: @college.unit, user_id: @college.user.id, background_color: @college.background_color, font_family: @college.font_family, background_image: @college.background_image, font_color: @college.font_color, request_to_participate: @college.request_to_participate, admin_approves_spotted: @college.admin_approves_spotted}}

                expect(response.status).to eq(302)
            end
        end
    end

    describe "GET #show" do
        before(:each) do
            @current_user = FactoryBot.create(:user)
            @college = FactoryBot.create(:college)
            @college.save
        end

        context "user logged in" do
            before(:each) do
                session[:user_id] = @current_user.id
            end

            it "has a 200 status code" do
                get :show, params: {id: @college.id}

                expect(response.status).to eq(200)
            end
        end

        context "user not logged in" do
            it "has a 302 status code" do
                get :show, params: {id: @college.id}

                expect(response.status).to eq(302)
            end
        end        
    end

    describe "POST #favorite" do
        before(:each) do
            @current_user = FactoryBot.create(:user)
            @college = FactoryBot.create(:college)
            @college.save
        end
        
        context "user logged in" do
            before(:each) do
                session[:user_id] = @current_user.id
            end

            it "notice that you have favorited" do
                post :favorite, params: {id: @college.id, type: "favorite"}

                expect(response).to redirect_to(colleges_path)
                expect(flash[:success]).to match(/Você favoritou*/)
            end

            it "notice that you have unfavorited" do
                post :favorite, params: {id: @college.id, type: "unfavorite"}

                expect(response).to redirect_to(colleges_path)
                expect(flash[:success]).to match(/Você desfavoritou*/)
            end

            it "notice that you have done nothing" do
                post :favorite, params: {id: @college.id, type: ""}

                expect(response).to redirect_to(colleges_path)
                expect(flash[:notice]).to match(/Nada aconteceu*/)
            end
        end

        context "user not logged in" do
            it "notice that you have favorited - has a 302 status code" do
                post :favorite, params: {id: @college.id, type: "favorite"}

                expect(response.status).to eq(302)
            end

            it "notice that you have unfavorited - has a 302 status code" do
                post :favorite, params: {id: @college.id, type: "unfavorite"}

                expect(response.status).to eq(302)
            end

            it "notice that you have done nothing - has a 302 status code" do
                post :favorite, params: {id: @college.id, type: ""}

                expect(response.status).to eq(302)
            end
        end
    end

    describe "POST #update" do
        before(:each) do
            @current_user = FactoryBot.create(:user)
            @college = FactoryBot.create(:college)
            @college.save
        end

        context "user logged in" do
            before(:each) do
                session[:user_id] = @current_user.id
            end

            it "success updating college settings" do
                put :update, params: {college: {name: @college.name, initials: @college.initials, city: @college.city, state: @college.state, country: @college.country, unit: @college.unit, user_id: @college.user.id, background_color: @college.background_color, font_family: @college.font_family, background_image: @college.background_image, font_color: @college.font_color, request_to_participate: @college.request_to_participate, admin_approves_spotted: @college.admin_approves_spotted}, id: @college.id}

                expect(response).to redirect_to(edit_college_path(@college))
                expect(flash[:success]).to match(/Dados atualizados*/)
            end
            
            it "failed updating college settings - render edit college" do
                put :update, params: {college: {name: @college.name, initials: @college.initials, city: @college.city, state: @college.state, country: @college.country, unit: @college.unit, user_id: @college.user.id, background_color: "12", font_family: @college.font_family, background_image: @college.background_image, font_color: @college.font_color, request_to_participate: @college.request_to_participate, admin_approves_spotted: @college.admin_approves_spotted}, id: @college.id}

                expect(response).to render_template(:edit)
            end
        end
        
        context "user not logged in" do
            it "has a 302 status code" do
                put :update, params: {college: {name: @college.name, initials: @college.initials, city: @college.city, state: @college.state, country: @college.country, unit: @college.unit, user_id: @college.user.id, background_color: @college.background_color, font_family: @college.font_family, background_image: @college.background_image, font_color: @college.font_color, request_to_participate: @college.request_to_participate, admin_approves_spotted: @college.admin_approves_spotted}, id: @college.id}

                expect(response.status).to eq(302)                
            end
        end
    end

    describe "DELETE #destroy" do

        context "current user is the page manager" do
            before(:each) do
                @current_user = FactoryBot.create(:user)
                @college = FactoryBot.create(:college)
            end

             it 'success delete college' do
                @college.destroy
                expect{
                    @college.reload
                }.to raise_error ActiveRecord::RecordNotFound
             end
        end
    end
end
