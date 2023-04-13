class Api::V1::CommentsController < ApiController
  before_action :authorize_request, only: [:create]

  def index
    # /api/v1/users/:user_id/posts/:post_id/comments(.:format)
    # @user = User.includes(posts: [comments: [:user]]).find(params[:user_id])
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])

    render json: @post.comments
  end

  def create
    @text = params[:text]
    @new_comment = Comment.create(text: @text, user_id: @current_user.id, post_id: params[:post_id])
    render json: @new_comment
  end
end
