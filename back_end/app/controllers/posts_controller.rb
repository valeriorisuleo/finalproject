class PostsController < ApplicationController

  # This is a method that runs before any other controller action.
  before_action :set_post, only: [:show, :update, :destroy]

  # It checks if there is a valid user
  skip_before_action :authenticate_user!, only: [:index, :show]


  # GET /posts
  def index
    @posts = Post.all

    render json: @posts
  end

  # GET /posts/1
  def show
    render json: @post
  end

  # POST /posts
  def create
    @post = Post.new(post_params)

    @post.user = current_user
  #///////////////////////////////////////////
    @content = Content.new(content_params)
    @content.post = @post
    @content.user = current_user

    unless @content.save
      render json: @content.errors, status: :unprocessable_entity
    end
#///////////////////////////////////////////
    if @post.save
      render json: @post, status: :created, location: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def post_params
      params.require(:post).permit(:image)
    end
    def content_params
      params.permit(:title, :body, :language)
    end
end
