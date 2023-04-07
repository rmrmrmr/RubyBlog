class LikesController < ApplicationController
  def create
    @like = Like.new(user_id: current_user.id, post_id: params[:post_id])
    return unless @like.save

    redirect_to user_post_path(user_id: :user_id, id: :post_id), notice: 'Like was successfully created.'
  end
end
