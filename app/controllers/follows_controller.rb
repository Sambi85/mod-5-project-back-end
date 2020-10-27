class FollowsController < ApplicationController
  skip_before_action :authorized, only: [:index, :show, :create, :update, :destroy]
 
  def index
    follows = Follow.all
    render :json => follows, each_serializer: FollowSerializer 
  end

  def show
    follow = Follow.find(params[:id])
    render :json => follow, each_serializer: FollowSerializer 
  end

  def create
    follow = Follow.create(follow_params)
    render :json => follow, each_serializer: FollowSerializer 
  end

  def update
    follow = Follow.find(params[:id])
      follow.update(follow_params)
      render :json => follow, each_serializer: FollowSerializer 
  end

  def destroy
    follow = Follow.find(params[:id])
      follow.destroy
      render json:{}
  end 
  
  private

  def follow_params
    params.require(:follow).permit(:leader_id, :follower_id, :date)
  end

end
