class PostsController < ApplicationController
  skip_before_action :authorized, only: [:index, :show, :create, :update, :destroy]

  def index
    posts = Post.all
    render :json => posts, each_serialzer: PostSerializer
  end

  def show
    post = Post.find(params[:id])
    render :json => post, serialzer: PostSerializer
  end

  def create
    post = Post.create(post_params)
    render :json => post
  end

  def update
    post = Post.find(params[:id])
      post.update(post_params)
      render :json => post, serialzer: PostSerializer
  end

  def destroy
    post = Post.find(params[:id])
      post.destroy
      render json:{}
  end 
  
  private

  def post_params
    params.require(:post).permit(:img, :description, :date, :user_id)
  end

end