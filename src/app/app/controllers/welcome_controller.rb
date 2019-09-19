class WelcomeController < ApplicationController
   before_action :require_unlogged_user

   def require_unlogged_user
    return if !user_signed_in?
    redirect_to user_path(current_user)
   end 
end
