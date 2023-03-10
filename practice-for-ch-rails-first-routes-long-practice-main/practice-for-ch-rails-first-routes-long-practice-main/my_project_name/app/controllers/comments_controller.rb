class CommentsController < ApplicationController
    def create
        comment = Comment.new(comment_params)
        if comment.save
            render json: comment, status: :created
        else
            render json: comment.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        id = params[:id]
        comment = Comment.find_by(id: id)
        if comment && comment.destroy
            render json: comment
        else
            render json: comment.errors.full_messages, status: 422
        end

    end

    def index
        user_id = params[:user_id]
        artwork_id = params[:artwork_id]
        if user_id
            comments = Comment.find_by(author_id: user_id)
            if comments
                render json: comments
            end
        elsif artwork_id
            comments = Comment.find_by(artwork_id: artwork_id)
            if comments
                render json: comments
            end
        else
            render json: comments.errors.full_messages, status: :unprocessable_entity
        end
    end

    private
    def comment_params
        params.require(:comment).permit(:body, :artwork_id, :author_id)
    end
end
