class CommentsController < ApplicationController
  load_and_authorize_resource only: [:destroy]

  def new
    @post = Post.find(params[:post_id])
    @user = User.find(params[:user_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @user = User.find(params[:user_id])
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.post = @post
    if @comment.save
      @post.update_comments_counter(params[:post_id])
      redirect_to user_post_path(@user.id, @post.id)
    else
      flash.now[:error] = 'Error: Comment could not be created'
      render :new, locals: { comment: @comment }
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @user = User.find(params[:user_id])
    comment = Comment.find(params[:id])
    respond_to do |f|
      f.html do
        if comment.destroy
          @post.update_comments_counter(params[:post_id])
          redirect_to user_post_path(@user.id, @post.id)
        else
          flash.now[:error] = 'Error: failed to delete comment'
          render :new, locals: { comment: }
        end
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
