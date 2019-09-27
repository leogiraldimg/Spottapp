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
        @comment.spotted = Spotted.find(id: params[:id])
        if @comment.save
            flash[:sucess] = 'Comentário feito com sucesso'
            redirect_to root_path
        else
            render 'new'
        end
    end

    private 
        def comment_params
            params.require(:comment).permit(:content)
        end

        def set_user_creator
            user = User.find_by(email: current_user.email.downcase)
        end
end
