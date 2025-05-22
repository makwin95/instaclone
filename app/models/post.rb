# frozen_string_literal: true

# This is the Post model.
# It is used to create and manage posts in the application.
class Post < ApplicationRecord
  validates :title, presence: true,
                    length: { minimum: 5, maximum: 100 }
  validates :description, presence: true,
                          length: { minimum: 5, maximum: 100 }
  validates :keywords, presence: true,
                       length: { minimum: 5, maximum: 100 }

  has_many_attached :images
end
