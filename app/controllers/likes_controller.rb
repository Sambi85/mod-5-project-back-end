
class LikesController < ApplicationController
  skip_before_action :authorized, only: [:index, :show, :create, :update, :destroy]
  
  def index
    likes = Like.all
    render json: likes, each_serialzer: LikeSerializer
  end

  def show
    like = Like.find(params[:id])
    render json: like, serialzer: LikeSerializer
  end

  def create
    like = Like.create(like_params)
    render json: like
  end

  def update
    like = Like.find(params[:id])
      like.update(like_params)
      render :json => like, serialzer: LikeSerializer
  end

  def destroy
    like = Like.find(params[:id])
    like.destroy
      render json:{}
  end 
    
  private

  def like_params
    params.require(:like).permit(:user_id, :post_id, :counter, :date)
  end

end
