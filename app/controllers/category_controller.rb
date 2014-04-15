class CategoryController < ApplicationController

	layout 'staff'

	
  def new

  end

  def create
  	@category = Category.new(params[:category])
  	if @category.save
  		flash[:success] = 'Category saved'
  		redirect_to :back
  	else
  		flash[:danger] = 'An error occured'
  		redirect_to :back
  	end
  end

  def edit
  	@cat = Category.find(params[:id])
  	flash[:success] = params
  	if @cat.update_attributes(params[:category])
  		flash[:success] = 'Category updated successfully'
  		redirect_to category_index_path
  	else
  		flash[:warning] = 'An error has occured'
  		redirect_to category_index_path(id: params[:id])
  	end
  end
  

  def destroy
  	cat = Category.find(params[:id])
  	cat.destroy
  	redirect_to category_index_path
  end

  def index
  	@categories = Category.all
  	@category = Category.find(params[:id]) if params[:id]
  	@category = Category.new if @category.nil?
  end
end
