class ReviewsController < ApplicationController
  before_action :set_review, only: [:update, :destroy, :edit]
  def index
    @reviews = Review.all
  end

  def create
    @review = Product.find(params[:product_id]).reviews.build(review_params.merge(user_id: current_user.id))
    if @review.save
      redirect_to @review.product, notice: 'Review was successfuly created!'
    else
      redirect_to @review.product, alert: @review.errors
    end
  end

  def edit
  end

  def update
    if @review.update(approve_params)
      redirect_to reviews_products_path, notice: 'Review was successfuly updated!'
    else
      redirect_to edit_product_review_path(@review.product, @review), alert: @review.errors
    end
  end

  def destroy
    @review.destroy
    render partial: 'reviews', locals: { reviews: Review.all }
  end

  private
  def review_params
    params.require(:review).permit(:body, :stars)
  end

  def approve_params
    params.require(:review).permit(:approved)
  end

  def set_review
    @review = Review.find(params[:id])
  end
end
