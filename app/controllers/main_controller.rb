class MainController < ApplicationController
  def index
    list
  end

  def list
    @posts = Post.order('created_at DESC').all
  end

  def category
  end

  def archive
  end

  def view_post
  end
end
