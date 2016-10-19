class CategoriesController < ApplicationController
  load_and_authorize_resource
  before_action :set_category, only: [:edit, :show, :update, :destroy]

  def index
    @categories = Category.all
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to @category, notice: 'You succesfully created category.'
    else
      redirect_to new_category_path, alert: @category.errors
    end
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def show
  end

  def update
    if @category.update(category_params)
      redirect_to @category, notice: 'Category was succesfully updated.'
    else
      redirect_to edit_category_path(@category), alert: @category.errors
    end
  end

  def destroy
    @category.products.each do |product|
      FileUtils.rm_rf("public/uploads/product/image/#{product.id}")
    end
    @category.destroy
    redirect_to categories_path, alert: 'Category was succesfully deleted.'
  end

  private
  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:title, :description)
  end
end
