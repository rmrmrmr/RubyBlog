class Api::V1::CommentsController < ApiController
  def index
    # /api/v1/users/:user_id/posts/:post_id/comments(.:format)
    # @user = User.includes(posts: [comments: [:user]]).find(params[:user_id])
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])

    render json: @post.comments
  end
end