# == Schema Information
#
# Table name: categories
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Category < ApplicationRecord
  has_many :products, dependent: :destroy
  validates :title, presence: true, length: { minimum: 4 }
  validates :description, presence: true, length: { minimum: 20 }
end
