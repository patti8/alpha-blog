class ArticlesController < ApplicationController
  before_action :set_params, only: [:edit, :show, :update, :destroy ]
 def index
   @articles = Article.all
 end

 def edit
 end

 def update
   if @article.update(articles_params)
     flash[:notice] = "Article was successfully updated"
     redirect_to @article
   else
     render 'edit'
   end
 end

 def new
   @article = Article.new
 end

 def show
 end

 def create
     @article = Article.new(articles_params)
     if @article.save
       flash[:notice] = "Article was successfully created"
       redirect_to article_path(@article)
    else
      render 'new'
    end
end
def destroy
  @article.destroy
  flash[:notice] = "article was deleted"
  redirect_to articles_path
end

  private
    def set_params
      @article = Article.find(params[:id])
    end
    def articles_params
      params.require(:article).permit(:title, :description)
    end

end
