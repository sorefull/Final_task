# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  price       :float
#  image       :string
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Product < ApplicationRecord
  # Validation
  validates :title, presence: true, length: { minimum: 4 }
  validates :description, presence: true, length: { minimum: 20 }
  validates :price, presence: true, numericality: { greater_than: 0 }

  # Categories
  belongs_to :category

  # Image
  mount_uploader :image, ImageUploader

  # Review
  has_many :reviews, dependent: :destroy
  def raiting
    approved_reviews = reviews.where(approved: true)
    reviews_length = approved_reviews.length
    if reviews_length < 1
      0
    else
      sum = 0
      approved_reviews.each do |review|
        sum += Review.stars[review.stars]
      end
      sum/reviews_length
    end
  end

  def a_reviews
    reviews.where(approved: true).count
  end

  # Orders
  has_and_belongs_to_many :orders
end
