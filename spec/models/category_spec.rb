require "rails_helper"

RSpec.describe Category, :type => :model do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
  it { should have_many(:products) }

  # describe 'instance methods and enum role' do
  #   context 'deffault user role' do
  #     let(:user) { create(:user) }
  #     let(:user_new) { build(:user) }
  #     it " after create shuld be 'user'" do
  #       expect(user.role).to eq "user"
  #     end
  #     it "before save shuld be 'guest'" do
  #       expect(user_new.guest?).to be true
  #     end
  #   end
  # end
end
