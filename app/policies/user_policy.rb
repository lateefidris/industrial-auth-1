class UserPolicy < ApplicationPolicy
  attr_reader :current_user, :user
  def initialize(current_user, user)
    @current_user = current_user
    @user = user
  end

  def feed?
    true
  end

  def show?
    true
  end

  def discover?
    true
  end

  def liked?
    true
  end

  def show_pending?
    user == current_user 
  end

  def show_private?
    user == current_user ||
    !user.private? ||
    user.followers.include?(current_user)
  end
end
