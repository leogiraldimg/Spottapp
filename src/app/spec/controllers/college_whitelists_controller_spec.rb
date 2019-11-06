require 'rails_helper'

RSpec.describe CollegeWhitelistsController, type: :controller do
    describe "GET #index" do
        before(:each) do
          @current_user = create(:user)
          session[:user_id] = @current_user.id
        end
      
        it "returns a success response if person is an admin" do
          @college = create(:college)
          @college_whitelists = CollegeWhitelist.all
          get :index, params: {college_id: @college.id}
          expect(response).to be_successful
        end
    
        it "returns a flash error if person is not admin" do
          @college = create(:college)
          @current_user = nil
          @current_user = create(:user, email: "teste002.user@spottapp.com.br", nickname: "teste002.user")
          session[:user_id] = @current_user.id
          get :index, params: {college_id: @college.id}
          expect(response).to redirect_to(colleges_path)
          expect(flash[:danger]).to match(/Área restrita. Você não é administrador da página./)
        end
    end
    
    describe "GET #verify_permission" do
        before(:each) do
          @current_user = create(:user)
          session[:user_id] = @current_user.id
        end
        
        it "renders :new" do
          @college = create(:college)
          @current_user = nil
          @current_user = create(:user, email: "teste002.user@spottapp.com.br", nickname: "teste002.user")
          session[:user_id] = @current_user.id
          get :verify_permission, params: {college_id: @college.id}
          expect(response).to render_template("new")
        end
    end
    
    describe "GET #new" do
        before(:each) do
          @current_user = create(:user)
          @college = create(:college)
          session[:user_id] = @current_user.id
        end
        
        it "redirects to verify_permission_path" do
          @current_user = nil
          @current_user = create(:user, email: "teste002.user@spottapp.com.br", nickname: "teste002.user")
          session[:user_id] = @current_user.id
          @college_whitelist = create(:college_whitelist_pending, user: @current_user)
          get :new, params: {college_id: @college.id}
          expect(response).to redirect_to(college_verify_permission_path)
        end
    end
end
