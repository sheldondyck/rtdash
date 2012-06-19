
class BlogController < ApplicationController
  BLOG_LIST_COUNT = 10

  def new
  end

  def create
  end

  def index
    @title = 'Blog'
    @blogs = Blog.last(BLOG_LIST_COUNT).reverse
    @offset = BLOG_LIST_COUNT
    @show_next_blog = false
    # TODO: always showing prev even for less then BLOG_LIST_COUNT blogs in db
    @show_previous_blog = true
  end

  def previous
    count = Blog.count
    @offset = params[:offset].to_i
    @blogs = Blog.limit(BLOG_LIST_COUNT).offset(count - BLOG_LIST_COUNT - @offset).reverse
    @offset += BLOG_LIST_COUNT
    @show_next_blog = (@offset > BLOG_LIST_COUNT)
    @show_previous_blog = (count - @offset >= BLOG_LIST_COUNT)
  end

  def next
    count = Blog.count
    @offset = params[:offset].to_i
    @blogs = Blog.limit(BLOG_LIST_COUNT).offset(count + BLOG_LIST_COUNT - @offset).reverse
    @offset -= BLOG_LIST_COUNT
    @show_next_blog = (@offset > BLOG_LIST_COUNT)
    @show_previous_blog = (count - @offset >= BLOG_LIST_COUNT)
  end

  def show
    @blog = Blog.find(params[:id])
    @title = 'Blog - ' + @blog.title
  end

  def destroy
  end
end
