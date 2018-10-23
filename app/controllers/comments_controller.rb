class CommentsController < ApplicationController
  def create
    comment = Comment.create(username: params[:username], content: params[:content], blog_post_id: params[:blog_post_id])

    redirect_to "/blog_posts/#{comment.blog_post_id}"
  end
  def destroy
    blog_post_id = Comment.find(params[:id]).blog_post_id
    Comment.find(params[:id]).destroy

    redirect_to "/blog_posts/#{blog_post_id}"
  end
end
