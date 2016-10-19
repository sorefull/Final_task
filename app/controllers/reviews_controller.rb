class ReviewsController < ApplicationController
  load_and_authorize_resource
  before_action :set_review, only: [:update, :destroy]

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

  def update
    @review.x_pprove!(params[:meth])
    redirect_to reviews_products_path, notice: 'Review was successfuly updated!'
  end

  def destroy
    @review.destroy
    render partial: 'reviews', locals: { reviews: Review.all }
  end

  private
  def review_params
    params.require(:review).permit(:body, :stars)
  end

  def set_review
    @review = Review.find(params[:id])
  end
end
