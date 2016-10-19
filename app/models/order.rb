# == Schema Information
#
# Table name: orders
#
#  id            :integer          not null, primary key
#  status        :integer          default("noncompleted")
#  user_id       :integer          not null
#  contact_phone :string
#  additional    :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
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
      completed!
      user.orders.create
      true
    else
      false
    end
  end

  enum status: [:noncompleted, :completed, :canceled, :sended]
end
