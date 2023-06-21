# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

      if user.admin?
        can :destroy, Post
      else
        can :read, :all
      end
end
