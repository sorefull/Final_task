require "rails_helper"

RSpec.describe Review, :type => :model do
  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:stars) }
  it { should belong_to(:user) }
  it { should belong_to(:product) }

  describe 'instance methods' do
    context 'x_pprove' do
      let(:review) { create(:review) }
      it "should be approved" do
        review.x_pprove!('approve')
        expect(review.approved).to eq true
      end    
      it "shuld be unapproved" do
        review.x_pprove!('unapprove')
        expect(review.approved).to eq false
      end
    end
  end
end
