class ReviewsController < ApplicationController
  before_action :set_product, only: [:create, :update, :destroy]
  def index
    @reviews = Review.where(approved: false)
  end

  def create
    @review = @product.reviews.build(review_params.merge(user_id: current_user.id))
    if @product.save
      redirect_to @review.product, notice: 'Review was successfuly created!'
    else
      redirect_to @review.product, alert: @review.errors
    end
  end

  def update
  end

  def destroy
  end

  private
  def review_params
    params.require(:review).permit(:body, :stars)
  end

  def set_product
    @product = Product.find(params[:product_id])
  end
end
