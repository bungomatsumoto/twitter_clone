class BlogsController < ApplicationController
  before_action :get_id_blog, only: [:show, :edit, :update, :destroy]

  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    if params[:back]
      render "new"
    else
      if @blog.save
        redirect_to blogs_path, notice: "投稿が完了しました"
      else
        render "new"
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: "投稿内容を編集しました"
    else
      render "edit"
    end
  end

  def confirm
    @blog = Blog.new(blog_params)
    render "new" if @blog.invalid?
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path, notice: "投稿を削除しました"
  end

  private

  def blog_params
    params.require(:blog).permit(:content)
  end

  def get_id_blog
    @blog = Blog.find(params[:id])
  end

end
