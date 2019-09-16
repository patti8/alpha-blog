class ArticlesController < ApplicationController
 def index
 end

 def new
   @article = Article.new
 end

 def show
   @article = Article.find(params[:id])
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

  private
    def articles_params
      params.require(:article).permit(:title, :description)
    end

end
