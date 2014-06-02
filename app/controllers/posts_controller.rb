class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]
  after_action :verify_authorized, except: [:show, :index]

  def index
    @posts = policy_scope(Post)
  end

  def show
    @commentable = @post
    @comment = Comment.new
  end

  def new
    @post = Post.new
    authorize @post, :publish?
  end

  def edit
    authorize @post, :publish?
  end

  def create
    @post = Post.new(post_params)
    authorize @post, :publish?

    respond_to do |format|
      if @post.save
        current_user.posts << @post
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    authorize @post, :publish?
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize @post, :publish?
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(*policy(@post || Post).permitted_attributes)
    end
end
