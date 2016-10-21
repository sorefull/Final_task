require "rails_helper"

RSpec.describe User, :type => :model do
  it { should validate_presence_of(:email) }
  it { should have_many(:reviews) }
  it { should have_many(:orders) }

  describe 'instance methods and enum role' do
    context 'deffault user role' do
      let(:user) { create(:user) }
      let(:user_new) { build(:user) }
      it " after create shuld be 'user'" do
        expect(user.role).to eq "user"
      end
      it "before save shuld be 'guest'" do
        expect(user_new.guest?).to be true
      end
    end

    context 'after create' do
      let(:user) { create(:user) }
      it "shuld have one noncompleted order" do
        expect(user.orders.first.present?).to be_truthy
        expect(user.orders.length).to eq 1
        expect(user.order).to eq user.orders.first
        expect(user.order.status).to eq "noncompleted"
      end
    end
  end
end
