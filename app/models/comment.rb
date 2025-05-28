# frozen_string_literal: true

# This is a comment model that represents a comment on a post.
class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :user, presence: true
  validates :text, presence: true
end
