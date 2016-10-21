require "rails_helper"

RSpec.describe Order, :type => :model do
  it { should belong_to(:user) }
  it { should have_and_belong_to_many(:products) }

  describe 'instance methods' do
    context 'with products' do
      let(:order) { create(:order) }
      let(:product) { create(:product) }
      it "should add and drop products to and from orders'" do
        expect(order.add_to_order(product)).to be_truthy
        expect(order.products.length).to eq 1
        expect(order.products.first).to eq product
        expect(order.add_to_order(product)).to be_falsey
        expect(order.drop_from_order(product)).to be_truthy
        expect(order.products).to be_empty
        expect(order.drop_from_order(product)).to be_falsey
      end
      it "should return total price'" do
        order.add_to_order(product)
        expect(order.total_price).to eq product.price
      end
      it "should be noncompleted at start" do
        expect(order.noncompleted?).to be_truthy
      end
      it "should buy products'" do
        expect(order.buy_products!).to be_falsey
        order.add_to_order(product)
        expect(order.buy_products!).to be_truthy
        expect(order.status).to eq 'completed'
      end
    end
  end
end
