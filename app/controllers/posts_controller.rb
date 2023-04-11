class PostsController < ApplicationController
  def index
    @user = User.includes(posts: [comments: [:user]]).find(params[:user_id])
    # @posts = @user.posts.includes(:comments)
  end

  def new
    @post = Post.new
    respond_to do |format|
      format.html { render :new, locals: { post: @post } }
    end
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user
    respond_to do |format|
      format.html do
        if @post.save
          redirect_to user_path(@current_user)
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

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
