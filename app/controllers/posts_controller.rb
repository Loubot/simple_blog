class PostsController < ApplicationController
  layout 'main'

  #before_filter :authenticate_user!
  def index
    posts = Post.order('updated_at ASC').all
    @posts = Kaminari.paginate_array(posts).page(params[:page]).per(3)
    @comment = Comment.new    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @categories = Category.all
    @post = Post.new
    @user_list = User.order('last_name ASC').all.collect { |user| [user.full_name, user.id] }
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
    @categories = Category.all
    @user_list = User.order('last_name ASC').all.collect { |user| [user.full_name, user.id] }
  end

  # POST /posts
  # POST /posts.json
  def create    
    @post = Post.new(params[:post])
    @post.author = User.find(params[:author_id])
    all_categories = get_all_categories
    category_objects = create_category_array(params[:categories])
    removed_categories = all_categories - category_objects
    respond_to do |format|
      if @post.save
        category_objects.each { |cat| @post.categories << cat if !@post.categories.include?(cat) }
        removed_categories.each { |cat| @post.categories.delete(cat) if @post.categories.include?(cat) }
        format.html {
          flash[:success] = 'Post created successfully'
          redirect_to root_url
        }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])
    @post.author = User.find(params[:author_id])
    all_categories = get_all_categories
    category_objects = create_category_array(params[:categories])
    removed_categories = all_categories - category_objects
    respond_to do |format|
      if @post.update_attributes(params[:post])
        category_objects.each { |cat| @post.categories << cat if !@post.categories.include?(cat) }
        removed_categories.each { |cat| @post.categories.delete(cat) if @post.categories.include?(cat) }
        format.html { 
          flash[:success] = 'Blog post successfully updated'
          redirect_to root_url
        }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  private #-------------------------

  def get_all_categories
    Category.order('name ASC').all
  end

  def create_category_array(cats)
    cats = [] if cats.blank?
    return cats.collect { |cat| Category.find(cat.to_i) }.compact
  end

end
