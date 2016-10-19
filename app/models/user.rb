# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  role                   :integer          default("user")
#  provider               :string
#  uid                    :string
#

class User < ApplicationRecord
  after_create :create_order
  # Devise
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook, :github, :linkedin]

  # Admin
  enum role: [:user, :admin] #[:moderator, :owner, etc]
  def guest?
    id.nil?
  end

  # Social
  def self.from_omniauth(auth)
      where(email: auth.info.email).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
      end
  end

  # Rewiews
  has_many :reviews, dependent: :destroy

  # Order
  has_many :orders, :dependent => :destroy
  has_many :products, through: :orders
  def create_order
    orders.create
  end
  def order
    orders.last
  end
end
