class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @user = current_user
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user

     if @article.save
       redirect_to @article
     else
       render 'new'
     end
   end

   def update
     @article = Article.find(params[:id])

     if @article.update(article_params)
       redirect_to @article
     else
       render 'edit'
     end
   end

   def destroy
     @article = Article.find(params[:id])
     @article.destroy

     redirect_to articles_path
   end

   def enroll
     @article = Article.find(params[:id])
     @article.enrollments << current_user
     @article.save
   end

  private
  def article_params
    params.require(:article).permit(:title, :text, :image, :remote_image_url)
  end

end
