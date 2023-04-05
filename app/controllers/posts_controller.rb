class PostsController < ApplicationController
  def index
    @posts = 'Here is a list of posts for a given user.'
  end

  def show
    @post = 'This is the page for the clicked post.'
  end
end
