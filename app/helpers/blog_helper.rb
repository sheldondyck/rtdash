module BlogHelper
  def blog_path(id)
    "/blog/#{id}"
  end

  def previous_blog_path(count)
    "/blog/previous/#{count}"
  end

  def next_blog_path(count)
    "/blog/next/#{count}"
  end
end
