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
end


