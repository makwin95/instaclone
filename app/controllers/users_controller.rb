# frozen_string_literal: true

# # This controller manages user-related actions such as viewing user profiles.
class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
end
