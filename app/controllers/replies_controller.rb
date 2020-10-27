class RepliesController < ApplicationController
  skip_before_action :authorized, only: [:index, :show, :create, :update, :destroy]

  def index
    replies = Reply.all
    render :json => replies, each_serializer: ReplySerializer 
  end

  def show
    reply = Reply.find(params[:id])
    render :json => reply, serialzer: ReplySerializer
  end

  def create
    reply = Reply.create(reply_params)
    render :json => reply
  end

  def update
    reply = Reply.find(params[:id])
      reply.update(reply_params)
      render :json => reply, serialzer: ReplySerializer
  end

  def destroy
    reply = Reply.find(params[:id])
      reply.destroy
      render json:{}
  end 
  
  private

  def reply_params
    params.require(:reply).permit(:user_id, :comment_id, :description, :date)
  end

end