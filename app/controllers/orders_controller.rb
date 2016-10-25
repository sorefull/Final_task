class OrdersController < ApplicationController
  load_and_authorize_resource
  before_action :set_resources, only: [:edit, :update]

  def index
    @co_orders = Order.where(status: :completed)
    @ca_orders = Order.where(status: :canceled)
    @se_orders = Order.where(status: :sended)
    UserNotifierMailer.send_order_email(Order.first.user, Order.first)
  end

  def edit
  end

  def show
    render partial: 'order', locals: { order: @order }
  end

  def update
    case params[:meth]
    when 'add'
      @order.add_to_order(@product)
      message = 'You succesfully added product to your cart.'
    when 'drop'
      @order.drop_from_order(@product)
      message = 'You succesfully dropped product.'
    when 'cancel'
      @order.canceled!
      message = 'You succesfully canceled order.'
    when 'restore'
      @order.completed!
      message = 'You succesfully restored order.'
    when 'send'
      @order.sended!
      message = 'You succesfully sended order.'
    when 'buy'
      @order.update(order_params)
      if @order.buy_products!
        UserNotifierMailer.send_order_email(@order.user, @order)
        message = 'We will contact you in nearest time, have a nice day!'
      else
        message = 'First add some products to your cart!'
      end
    end

    case params[:meth]
    when 'cancel', 'send', 'restore'
      redirect_to orders_path, notice: message
    when 'add'
      redirect_to @product, notice: message
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
  def set_resources
    @order = Order.find(params[:order_id]) if params[:order_id]
    @order = Order.find(params[:id]) if params[:id]
    @product = params[:product_id] ? Product.find(params[:product_id]) : nil
    @order ||= current_user.order
  end

  def order_params
    params.require(:order).permit(:contact_phone, :additional)
  end
end
