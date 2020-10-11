class RepliesController < ApplicationController

  def index
    replies = Reply.all
    render :json => replies
  end

  def show
    reply = Reply.find(params[:id])
    render :json => reply
  end

  def create
    reply = Reply.create(reply_params)
    render :json => reply
  end

  def update
    reply = Reply.find(params[:id])
      reply.update(reply_params)
      render :json => reply, serialzer: UserSerializer
  end

  def destroy
    reply = Reply.find(params[:id])
      reply.destroy
      render json:{}
  end 
  
  private

  def reply_params
    params.require(:reply).permit(:user_id, :post_id, :description, :date)
  end

end