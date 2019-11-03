class CommentsController < ApplicationController
    before_action :set_user_creator, only: [:new]

    def index
        @comments = @spotted.comments
    end

    def new
        @comment = Comment.new
        @comment.user = current_user
        @comment.spotted = @spotted
    end

    def create
        @comment = Comment.new(comment_params)
        @comment.user = current_user
        @comment.spotted = Spotted.find(params[:spotted_id])
        if @comment.save
            flash[:sucess] = 'Comentário feito com sucesso'
            redirect_to spotted_path(@comment.spotted)
        else
            render 'new'
        end
    end

    def destroy
        @comment = Comment.find(params[:id])  
        @comment.destroy
        flash[:success] = 'Comentário apagado com sucesso'
        redirect_to spotted_path(@comment.spotted)
    end

    private 
        def comment_params
            params.require(:comment).permit(:content)
        end

        def set_user_creator
            user = User.find_by(email: current_user.email.downcase)
        end
end
