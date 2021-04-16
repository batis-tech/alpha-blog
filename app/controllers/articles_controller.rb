class ArticlesController < ApplicationController

  before_action :set_article, only:[:show, :edit, :update, :destroy]
  def show
  end
  def index
    @articlesIndex =Article.all
  end
  def new
   @article = Article.new
  end
  def edit
  end
  def create
    @article = Article.new(aritcles_perams)
    if @article.save
      flash[:notice]= "Article was created successfully."
    redirect_to @article
  else
    render "new"
  end
  end
  def update
   if @article.update(aritcles_perams)
     flash[:notice] = "artice has been updated"
       redirect_to @article
   else
     render "edit"

   end
 end
 def destroy
 @article.destroy

 redirect_to articles_path
 end
 private  #mean it'ss only allowed in this contrller only

  def set_article
   @article = Article.find(params[:id])
 end

 def aritcles_perams
   params.require(:article).permit(:title, :description)
 end

end
