# frozen_string_literal: true

# This controller manages user-related actions such as viewing user profiles.
class UsersController < ApplicationController
  before_action :set_user
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
  end

  def follow
    current_user.send_follow_request_to(@user)
    @user.accept_follow_request_of(current_user)
    redirect_to users_path(@user), notice: 'Follow request sent.'
  end

  def unfollow
    current_user.unfollow(@user)
    redirect_to users_path(@user), notice: 'You have unfollowed this user.'
  end

  def accept
    current_user.accept_follow_request_of(@user)
    redirect_to users_path(@user), notice: 'Follow request accepted.'
  end

  def decline
    current_user.decline_follow_request_of(@user)
    redirect_to users_path(@user), notice: 'Follow request declined.'
  end

  def cancel
    current_user.remove_follow_request_of(@user)
    redirect_to users_path(@user), notice: 'Follow request cancelled.'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
