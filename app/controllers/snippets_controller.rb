class SnippetsController < ApplicationController
  def show
    @snippet = Snippet.find params[:id]
    if @snippet.user != current_user && @snippet.private == 1
      render :false
    end
  end

  def new
    @snippet = Snippet.new
  end

  def create
    snippet_params = params.require(:snippet).permit(:title, :work, :category_id, :private)
    @snippet = Snippet.new snippet_params
    @snippet.user = current_user
    if @snippet.save
      redirect_to category_path(@snippet.category_id), notice: "Snippet created!"
    else
      render :new
    end
    # render json: params
  end

  def snippet_language(snippet)
    c = Category.find snippet.category_id
    :"#{c.name}"
  end
  helper_method :snippet_language
end
