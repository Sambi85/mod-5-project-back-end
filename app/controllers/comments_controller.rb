class CommentsController < ApplicationController
  skip_before_action :authorized, only: [:index, :show, :create, :update, :destroy]

  def index
    comments = Comment.all
    render json: comments, each_serialzer: CommentSerializer
  end

  def show
    comment = Comment.find(params[:id])
    render json: comment, serialzer: CommentSerializer
  end

  def new
    comment = Comment.new
  end

  def create
    comment = Comment.create(comment_params)
    render json: comment
  end

  def update
    comment = Comment.find(params[:id])
      comment.update(comment_params)
      render :json => comment, serialzer: CommentSerializer
  end

  def destroy
    comment = Comment.find(params[:id])
      comment.destroy
      render json:{}
  end 
    
  private

  def comment_params
    params.require(:comment).permit(:user_id, :post_id, :description, :date)
  end

end