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

require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
