class CommentsController < ApplicationController
  def index
    redirect_back(fallback_location: "/blog_posts")
  end


  def create
    @new_comment = Comment.new(username: params[:username], content: params[:content], blog_post_id: params[:blog_post_id])


      if @new_comment.save 
        redirect_to "/blog_posts/#{@new_comment.blog_post_id}"
      else
        @blog_post = BlogPost.find(params[:blog_post_id])
        render '/blog_posts/show'
      end
  end

  def destroy
    blog_post_id = Comment.find(params[:id]).blog_post_id
    Comment.find(params[:id]).destroy

    redirect_to "/blog_posts/#{blog_post_id}"
  end
end
