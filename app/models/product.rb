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
  belongs_to :category
  validates :title, presence: true, length: { minimum: 4 }
  validates :description, presence: true, length: { minimum: 20 }
  validates :price, presence: true, numericality: { greater_than: 0 }
  mount_uploader :image, ImageUploader
end
