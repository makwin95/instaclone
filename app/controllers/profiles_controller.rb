# frozen_string_literal: true

## frozen_string_literal: true

# This is the ProfilesController.
class ProfilesController < ApplicationController
  def index
    @users = users
  end

  def users
    query = User.ransack(username_cont: search_query)
    @users = query.result(distince: true)
  end

  def search_query
    params[:query]
  end
end
