class LikesController < ApplicationController
    before_action :find_spotted

    def create
        if already_liked?
            flash[:notice] = "You can't like more than once"
        else
            @spotted.like.create(user_id: current_user.id)
        end
            redirect_to college_spotteds_path(@spotted.college)
    end

    def destroy
        if !(already_liked?)
          flash[:notice] = "Cannot unlike"
        else
          @like = Like.find(params[:id])  
          @like.destroy
        end
        redirect_to college_spotteds_path(@spotted.college)
      end

    private

    def find_spotted
        @spotted = Spotted.find(params[:spotted_id])
    end

    def already_liked?
        Like.where(user_id: current_user.id, spotted_id:
        params[:spotted_id]).exists?
    end
end
