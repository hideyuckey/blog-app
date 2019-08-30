class BlogsController < ApplicationController

  def index
    @blogs = Blog.order('created_at DESC').page(params[:page]).per(5)
  end

  def new
    @blog = Blog.new
  end

  def create
    Blog.create(blog_params)
    redirect_top_page
  end

  def destroy
    blog = Blog.find(params[:id])
    blog.destroy
    redirect_top_page
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    blog = Blog.find(params[:id])
    blog.update(blog_params)
    redirect_top_page
  end

  def redirect_top_page
    redirect_to controller: "blogs", action: "index"
  end

  private
  def blog_params
    params.require(:blog).permit(:text).merge(user_id: current_user.id)
  end

end
