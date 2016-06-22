class SnippetsController < ApplicationController
  def show
    @snippet = Snippet.find params[:id]
  end

  def new
    @snippet = Snippet.new
  end

  def create
    # @category = Category.find params[:category_id]
    snippet_params = params.require(:snippet).permit(:title, :work, :category_id)
    @snippet = Snippet.new snippet_params
    # @snippet.user = current_user
    # @snippet.category = @category
    if @snippet.save
      redirect_to category_path(@snippet.category_id), notice: "Snippet created!"
    else
      render :new
    end
  end
end
