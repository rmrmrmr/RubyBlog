class PostsController < ApplicationController
  load_and_authorize_resource only: [:destroy]

  def index
    @user = User.includes(posts: [comments: [:user]]).find(params[:user_id])
  end

  def new
    @post = Post.new
    respond_to do |format|
      format.html { render :new, locals: { post: @post } }
    end
  end

  def create
    @post = Post.new(post_params)
    @post.author = User.find(params[:user_id])
    respond_to do |format|
      format.html do
        if @post.save
          @post.update_posts_counter(params[:user_id])
          redirect_to user_path(@post.author)
        else
          flash.now[:error] = 'Error: Post could not be saved :('
          render :new, locals: { post: @post }
        end
      end
    end
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.author = User.find(params[:user_id])
    respond_to do |format|
      format.html do
        if @post.destroy
          @post.update_posts_counter(params[:user_id])
          redirect_to user_path(@post.author)
        else
          flash.now[:error] = 'Error: Post could not be deleted'
        end
      end
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
