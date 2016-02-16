class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_filter :signed_in_user, only: [:userposts, :edit, :update]
  before_filter :correct_user,   only: [:edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
#    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    
#    @post = Post.new(post_params)
    @post = current_user.posts.build(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render action: 'show', status: :created, location: @post }
      else
        format.html { render action: 'new' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    store_current_location
    @post.destroy
    respond_to do |format|
      format.html { redirect_to allposts_url }
      format.json { head :no_content }
    end
  end

  def userposts
    @posts = current_user.posts.paginate(page: params[:page], per_page: 10)
#    respond_to do |format|
#      format.html { render action: 'index', title: "tru lya-lya" }
#      format.json { head :no_content }
#    end
  end

  def allposts
    @posts = Post.paginate(page: params[:page], per_page: 10)
#    respond_to do |format|
#      format.html { render action: 'index' }
#      format.json { head :no_content }
#    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only signed in user can change profile
    def signed_in_user
      store_location
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end

    # Only correct user can change own profile
    def correct_user
      @user = @post.user #User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user) || current_user.admin?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :body, :image, user_id: current_user[:id])
    end
end
