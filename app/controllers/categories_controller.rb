class CategoriesController < ApplicationController

  before_action :set_category, only: [:edit, :show, :update, :destroy]

  def index
    @categories = Category.all
  end

  def create
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
    @category.destroy
    redirect_to categories_path, alert: 'Category was succesfully deleted.'
  end

  private
  def set_category
    @category = Category.find(params[:id])
  end
end
