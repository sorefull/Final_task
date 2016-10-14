class ProductsController < ApplicationController

  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product, notice: 'You succesfully created product.'
    else
      redirect_to new_product_path, alert: @product.errors
    end
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def show
  end

  def update
    if @product.update(product_params)
      redirect_to @product, notice: 'Product was succesfully updated.'
    else
      redirect_to edit_product_path(@product), alert: @product.errors
    end
  end

  def destroy
    @product.destroy
    FileUtils.rm_rf("public/uploads/product/image/#{params[:id]}")
    redirect_to products_path, alert: 'Product was succesfully deleted.'
  end

  def welcome
    @products = Product.limit(25).order("RANDOM()")
  end

  private
  def product_params
    params.require(:product).permit(:title, :description, :price, :image, :category_id)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
