class BlogPostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    if params[:tag] && params[:tag].length > 2
      @tag_name = params[:tag]
      @tag = Tag.where('name iLIKE ?', "%#{@tag_name}%")[0]

      if @tag != nil
        @blog_posts = @tag.blog_posts
    else
        @blog_posts = []
      end
    elsif params[:tag] && params[:tag].length < 3
      @error_message = "Enter a topic with 3 or more characters!!!"
      @blog_posts = BlogPost.all.order(id: :asc)
    else
      @blog_posts = BlogPost.all.order(id: :asc)
    end

    respond_to do |format|
      format.html {render 'index'}
      format.json {render json: @blog_posts, status: 200}
    end
  end
  def show
    @blog_post = BlogPost.find(params[:id])
    @new_comment = Comment.new
  end

  def new
    @blog_post = BlogPost.new
    @tags = Tag.all
  end

  def create

    @blog_post = BlogPost.new(title: params[:title] , content: params[:content], user_id: current_user.id)

    if @blog_post.save
        @blog_post.create_tags(params[:tag_ids]) if params[:tag_ids]
        redirect_to("/blog_posts/#{@blog_post.id}")
    else
        @tags = Tag.all
        render 'new'
    end
  end
  
  def edit
    @blog_post = BlogPost.find(params[:id])
  end

  def update
    @blog_post = BlogPost.find(params[:id])

    if @blog_post.update(title: params[:title] , content: params[:content])
      @blog_post.update_tags(params[:tag_ids]) if params[:tag_ids]
    redirect_to ("/blog_posts/#{@blog_post.id}")
    else
      @tags = Tag.all
      render 'edit'     
    end
  end

  def destroy
    @blog_post = BlogPost.find(params[:id])
    @blog_post.destroy

    redirect_to ("/blog_posts")
  end
end

