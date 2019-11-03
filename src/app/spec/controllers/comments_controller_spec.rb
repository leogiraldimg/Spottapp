require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
    describe "DELETE #destroy" do

        context "current user is the comment owener" do
            before(:each) do
                @current_user = FactoryBot.create(:user)
                @comment = FactoryBot.create(:comment)
            end

             it 'success delete comment' do
                expect{ 
                    expect(@comment.user_id).to eql(@current_user.id)
                    params = {:spotted_id => @comment.spotted_id, :id => @comment.id}
                    delete :destroy, params: params
                }.to change(Comment, :count).by(-1)
             end
        end
    end
end
