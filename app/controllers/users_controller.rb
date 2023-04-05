class UsersController < ApplicationController
  def index
    @users = 'Here is a list of users.'
  end

  def show
    @users = 'This is the profile page of the selected user.'
  end
end
