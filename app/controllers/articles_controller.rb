class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end
  def show
    @article = Article.find(params[:id])
  end
  def new
    @articles = Article.new
  end
  def edit
    @articles = Article.find(params[:id])
  end
  def create
    @articles = Article.create(article_params)
    redirect_to articles_path(@article)
  end
  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    redirect_to article_path(@article)
  end
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path(@article)
  end
  def mark_as_done
    @article = Article.find(params[:id])
    @article.completed = !@article.completed
    @article.save
    redirect_to articles_path
  end

private

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
