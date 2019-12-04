require 'rails_helper'

RSpec.describe LikesController, type: :controller do
    describe "POST #create" do
        before(:each) do
            @current_user = FactoryBot.create(:user)
            @spotted1 = FactoryBot.create(:spotted)
        end

        context "user logged in" do
            before(:each) do
                session[:user_id] = @current_user.id
            end

            it "redirected to spotted_path" do
                post :create, params: {spotted_id: @spotted1.id, origin: "modal"}

                expect(response).to redirect_to(college_spotted_path(@spotted1.college.id, @spotted1.id))
            end

            it "redirected to spotteds_path" do
                post :create, params: {spotted_id: @spotted1.id}

                expect(response).to redirect_to(college_spotteds_path(@spotted1.college))
            end

            it "already_liked" do
                post :create, params: {spotted_id: @spotted1.id, origin: "modal"}
                post :create, params: {spotted_id: @spotted1.id, origin: "modal"}

                expect(flash[:notice]).to match(/You can't like more than once*/)
            end
        end

        context "user not logged in" do
            context "user not logged in" do
                it "has a 302 status code" do
                    post :create, params: {spotted_id: @spotted1.id, origin: "modal"}

                    expect(response.status).to eq(302)
                end
            end
        end
    end

    describe "DELETE #destroy" do
        before(:each) do
            @current_user = FactoryBot.create(:user)
            @spotted1 = FactoryBot.create(:spotted)
            @like = FactoryBot.create(:like)
        end
        
        context "user logged in" do
            before(:each) do
                session[:user_id] = @current_user.id
            end

            it "redirected to spotted_path" do
                delete :destroy, params: {spotted_id: @spotted1.id, id: @like.id, origin: "modal"}

                expect(response).to redirect_to(college_spotted_path(@spotted1.college.id, @spotted1.id))
            end

            it "redirected to spotteds_path" do
                delete :destroy, params: {spotted_id: @spotted1.id, id: @like.id}

                expect(response).to redirect_to(college_spotteds_path(@spotted1.college))
            end
        end

        context "user not logged in" do
            it "has a 302 status code" do
                delete :destroy, params: {spotted_id: @spotted1.id, id: @like.id, origin: "modal"}

                expect(response.status).to eq(302)
            end
        end        
    end
end
