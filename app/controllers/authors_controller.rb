class AuthorsController < ApplicationController
  def show
    @author = Author.find(params[:id])
  end
  
  def new
  end
  
  # def update
  #   @author = Author.update(params[:id])
  #     if @author.valid?
  #       redirect_to @author
  #     else
  #       render :edit
  #     end
  # end

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

  def author_params
    params.permit(:email, :name)
  end
end

# Change AuthorsController#create to re-render the form if the new author is invalid.
