# frozen_string_literal: true

# This is the User model.
# It is used to create and manage users in the application.
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  followability

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_one_attached :avatar

  before_create :randomize_id

  def unfollow(user)
    followerable_relationships.where(followable_id: user.id).destroy_all
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[bio created_at email id username updated_at]
  end

  private

  def randomize_id
    loop do
      self.id = SecureRandom.random_number(1_000_000_000)
      break unless User.where(id:).exists?
    end
  end
end
