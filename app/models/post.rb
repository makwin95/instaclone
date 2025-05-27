# frozen_string_literal: true

# This is the Post model.
# It is used to create and manage posts in the application.
class Post < ApplicationRecord
  belongs_to :user

  has_many_attached :images
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :title, presence: true, length: { minimum: 5, maximum: 100 }
  validates :description, length: { maximum: 100 }
  validates :keywords, length: { maximum: 100 }

  before_create :randomize_id

  private

  def randomize_id
    loop do
      self.id = SecureRandom.random_number(1_000_000_000)
      break unless User.where(id:).exists?
    end
  end
end
