class PostsController < ApplicationController
  before_action :set_post!, only: [:show, :edit, :update]

  def show
  end

  def edit
  end

  def update
    @post.update(post_params)
      if @post.valid?
        redirect_to @post 
      else  
        render :edit 
      end 
  end

  def create
    @author = Author.new(author_params)
      if @author.valid?
        @author.save
        redirect_to @author
      else
        render :new
      end
  end

  private

  def post_params
    params.permit(:category, :content, :title)
  end

  def set_post!
    @post = Post.find(params[:id])
  end
end

# Change PostsController#update to re-render the form if the updated post is invalid.
