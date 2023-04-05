class UsersController < ApplicationController
  def index
    @users = 'Here is a list of users.'
  end

  def show
    @users = "This is the clicked user's profile."
  end
end
