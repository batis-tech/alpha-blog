class ArticlesController < ApplicationController

  before_action :set_article, only:[:show, :edit, :update, :destroy]
  before_action :require_user, except: [:show , :index]
  before_action :require_same_user, only:[:edit, :update, :destroy]
  def show
  end
  def index
    @articlesIndex =Article.paginate(page: params[:page], per_page: 3)
  end
  def new
   @article = Article.new
  end
  def edit
  end
  def create
    @article = Article.new(aritcles_perams)
    @article.user = current_user
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
 private  #mean it's only allowed in this contrller only

  def set_article
   @article = Article.find(params[:id])
 end

 def aritcles_perams
   params.require(:article).permit(:title, :description, category_ids: [])
 end
 def require_same_user
   if current_user != @article.user && !current_user.admin?
     flash[:alert] = "You can only edit or delete yoour own article"
     redirect_to @article
   end
end


end
