class BlogPostsController < ApplicationController
  before_action :set_blog_post, only: [:show, :edit, :update, :destroy]

  def index
    @blog_posts = BlogPost.all
  end

  def show
  end

  def new
    @blog_post = BlogPost.new
  end

  def edit
  end

  def create
    @blog_post = BlogPost.new(blog_post_params)

    respond_to do |format|
      if @blog_post.save
        format.html { redirect_to @blog_post, notice: 'Blog post was successfully created.' }
        format.json { render :show, status: :created, location: @blog_post }
      else
        format.html { render :new }
        format.json { render json: @blog_post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @blog_post.update(blog_post_params)
        format.html { redirect_to @blog_post, notice: 'Blog post was successfully updated.' }
        format.json { render :show, status: :ok, location: @blog_post }
      else
        format.html { render :edit }
        format.json { render json: @blog_post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @blog_post.destroy
    respond_to do |format|
      format.html { redirect_to blog_posts_url, notice: 'Blog post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_blog_post
      @blog_post = BlogPost.find(params[:id])
    end

    def blog_post_params
      params.require(:blog_post).permit(:title, :content, :PublishDate)
    end
end
