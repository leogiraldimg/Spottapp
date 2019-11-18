require 'rails_helper'

RSpec.describe SpottedsController, type: :controller do
  
    describe "DELETE #destroy" do

        context "current user is the page manager" do
            before(:each) do
                @current_user = FactoryBot.create(:user)
                @college = FactoryBot.create(:college)
                @spotted = FactoryBot.create(:spotted)
            end

             it 'success delete spotted' do
                expect{ 
                    expect(@college.user_id).to eql(@current_user.id)
                    params = {:college_id => @spotted.college_id, :id => @spotted.id}
                    delete :destroy, params: params
                }.to change(Spotted, :count).by(-1)
             end
        end
    end

    describe "POST #favorite" do
        before(:each) do
            @current_user = FactoryBot.create(:user)
            @spotted = FactoryBot.create(:spotted)
        end
        
        context "user logged in" do
            before(:each) do
                session[:user_id] = @current_user.id
            end

            it "notice that you have favorited" do
                post :favorite, params: {id: @spotted.id, type: "favorite"}

                expect(response).to redirect_to(college_spotteds_path(@spotted.college))
                expect(flash[:success]).to match(/Você favoritou*/)
            end

            it "notice that you have unfavorited" do
                post :favorite, params: {id: @spotted.id, type: "unfavorite"}

                expect(response).to redirect_to(college_spotteds_path(@spotted.college))
                expect(flash[:success]).to match(/Você desfavoritou*/)
            end
        end
    end
end


