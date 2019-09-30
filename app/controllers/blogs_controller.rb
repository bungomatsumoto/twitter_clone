class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to new_blog_path, notice: "投稿が完了しました"
    else
      render "new"
    end
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def edit
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: "投稿内容を編集しました"
    else
      render "edit"
    end
  end

  private

  def blog_params
    params.require(:blog).permit(:content)
  end

  def get_id_blog
    @blog = Blog.find(params[:id])    
  end

end
