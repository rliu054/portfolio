class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(params[:post].permit(:title, :body))
      redirect_to @post, notice: "Your post was successfully updated."
    else
      render 'edit'
    end
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, notice: "Your post was successfully created."
    else
      render 'new', notice: "Unable to save your post."
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

  private
    def post_params
      params.require(:post).permit(:title, :body, :slug)
    end

    def find_post
      @post = Post.friendly.find(params[:id])
    end
end
