# == Schema Information
#
# Table name: reviews
#
#  id         :integer          not null, primary key
#  body       :text
#  stars      :integer
#  user_id    :integer
#  product_id :integer
#  approved   :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Review < ApplicationRecord
  # Validation
  validates :body, presence: true, length: { maximum: 140 }
  validates :stars, presence: true#, numericality: { greater_than: 0, less_than: 6 }

  # Devise
  belongs_to :user

  # Admin

  # Product
  belongs_to :product

  # Stars
  enum stars: [:poor, :fair, :good, :very_good, :excellent, :extraordinary]

end
