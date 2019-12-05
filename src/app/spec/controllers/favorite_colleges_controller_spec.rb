require 'rails_helper'

RSpec.describe FavoriteCollegesController, type: :controller do
    describe "GET #show" do
        before(:each) do
            @current_user = FactoryBot.create(:user)
        end

        context "user logged in" do
            before(:each) do
                session[:user_id] = @current_user.id
            end

            it "has a 200 status code" do
                get :show

                expect(response.status).to eq(200)
            end
        end

        context "user not logged in" do
            it "has a 302 status code" do
                get :show

                expect(response.status).to eq(302)
            end
        end
    end
end
