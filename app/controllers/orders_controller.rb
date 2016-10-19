class OrdersController < ApplicationController
  load_and_authorize_resource
  before_action :set_order, only: [:edit, :update]

  def index
    @orders = Order.where(status: [:completed, :sended, :canceled])
  end

  def edit
  end

  def update
    order = Order.find(params[:order_id]) if params[:order_id]
    product = Product.find(params[:product_id]) if params[:product_id]
    case params[:meth]
    when 'add'
      @order.add_to_order(product)
      message = 'You succesfully added product to your cart.'
    when 'drop'
      @order.drop_from_order(product)
      message = 'You succesfully dropped product.'
    when 'cancel'
      order.canceled!
      message = 'You succesfully canceled order.'
    when 'send'
      order.sended!
      message = 'You succesfully sended order.'
    when 'buy'
      @order.update(order_params)
      if @order.buy_products!
        message = 'We will contact you in nearest time, have a nice day!'
      else
        message = 'First add some products to your cart!'
      end
    end
    if params[:meth] == ('cancel' or 'send')
      redirect_to orders_path, notice: message
    else
      redirect_to shopping_cart_path, notice: message
    end
  end


  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    @order.user.orders.create
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
