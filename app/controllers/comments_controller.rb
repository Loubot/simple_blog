class CommentsController < ApplicationController

	before_filter :authenticate_user!

  def index
  	list
  	
  end

  def list
  	@comment = Comment.new(params[:comment])
  	@comments = Comment.order('created_at DESC').all
  	if @comment.save
  		flash[:success] = 'Comment saved successfully'
  		redirect_to posts_path
  	else
  		flash[:danger] = "Comment did not save"
  		redirect_to :back
  	end
  	
  end

  def show
  	@comment = Comment.find(params[:id])
  end
end
