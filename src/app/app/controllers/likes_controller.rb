class LikesController < ApplicationController
    before_action :find_spotted, :require_logged_in_user

    def create
        if already_liked?
            flash[:notice] = "You can't like more than once"
        else
            @spotted.like.create(user_id: current_user.id)
        end

        if params[:origin] == 'modal'
            redirect_to college_spotted_path(@spotted.college.id, @spotted.id)
        else
            redirect_to college_spotteds_path(@spotted.college)
        end
    end

    def destroy
        if !(already_liked?)
          flash[:notice] = "Cannot unlike"
        else
          @like = Like.find(params[:id])  
          @like.destroy
        end
        if params[:origin] == 'modal'
            redirect_to college_spotted_path(@spotted.college.id, @spotted.id)
        else
            redirect_to college_spotteds_path(@spotted.college)
        end
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
