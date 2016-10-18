# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Order < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :products

  def add_to_order(product)
    unless products.exists? product
      products << product
      true
    else
      false
    end
  end

  def drop_from_order(product)
    if products.exists? product
      products.delete product
      true
    else
      false
    end
  end

  def total_price
    total = 0.0
    products.each do |product|
      total += product.price
    end
    total
  end

  def buy_products!
    # call mailer (mail to user, email to admin, completed!, create new empty order)
    if products.count > 0
      update(completed: true)
      user.orders.create
      true
    else
      false
    end
  end
end
