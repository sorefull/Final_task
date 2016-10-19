class OrdersController < ApplicationController
  load_and_authorize_resource
  before_action :set_order, only: [:edit, :update]

  def index
    @orders = Order.where(completed: true)
  end

  def edit
  end

  def update
    product = Product.find(params[:product_id]) if params[:product_id]
    case params[:meth]
    when 'add'
      @order.add_to_order(product)
      message = 'You succesfully added product to your cart.'
    when 'drop'
      @order.drop_from_order(product)
      message = 'You succesfully dropped product.'
    when 'buy'
      @order.update(order_params)
      if @order.buy_products!
        message = 'We will contact you in nearest time, have a nice day!'
      else
        message = 'First add some products to your cart!'
      end
    end
    redirect_to shopping_cart_path, notice: message
  end


  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to orders_path, notice: 'You succesfully deleted an order.'
  end

  private
  def set_order
    @order = current_user.order
  end

  def order_params
    params.require(:order).permit(:contact_phone, :additional)
  end
end
