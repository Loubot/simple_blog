class CategoryController < ApplicationController

	layout 'staff'
  def new
  	@category = Category.new
  end

  def update
  	flash[:danger] = params[:id]
  	redirect_to :back
  end

  def destroy
  	cat = Category.find(params[:id])
  	cat.destroy
  	redirect_to category_index_path
  end

  def index
  	@categories = Category.all
  end
end
