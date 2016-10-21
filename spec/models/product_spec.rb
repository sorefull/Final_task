require "rails_helper"

RSpec.describe Product, :type => :model do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:price) }
  it { should belong_to(:category) }
  it { should have_many(:reviews) }
  it { should have_and_belong_to_many(:orders) }

  describe 'instance methods' do
    context 'raiting method without reviews' do
      let(:product) { create(:product) }
      it "should show 'no raiting string'" do
        expect(product.raiting).to eq 'No raiting yet.'
      end
    end
    context 'raiting method with review' do
      let(:review) { create(:review, approved: true) }
      it "shuld show raiting" do
        expect(review.product.raiting).not_to eq 'No raiting yet.'
      end
    end
  end
end
