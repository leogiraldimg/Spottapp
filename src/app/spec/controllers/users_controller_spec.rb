require 'rails_helper'

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

        it "redirected to root_url" do
            post :create, params: {user: {email: @user.email, nickname: @user.nickname, first_name: @user.first_name, last_name: @user.last_name, password: @user.password, password_confirmation: @user.password_confirmation, birth_date: @user.birth_date, city: @user.city, state: @user.state, country: @user.country}}

            expect(response).to redirect_to(root_url)
        end

        it "rendered new" do
            post :create, params: {user: {email: "", nickname: @user.nickname, first_name: @user.first_name, last_name: @user.last_name, password: @user.password, password_confirmation: @user.password_confirmation, birth_date: @user.birth_date, city: @user.city, state: @user.state, country: @user.country}}

            expect(response).to render_template(:new)
        end
    end
end
