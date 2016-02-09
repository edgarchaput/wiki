class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
  @articles = Article.all
  end

  def show
  @article  = Article.find(params[:id])
  renderer = Redcarpet::Render::HTML.new(no_links: true, hard_wrap: true)
  @markdown = Redcarpet::Markdown.new(renderer, extensions = {})
  end

  def new
  @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new(article_params)
    @article.save
    redirect_to article_path(@article)
  end

  def update
    @article.update(article_params)
    redirect_to article_path(@article)
  end

  def destroy
    @article.delete
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end

  def set_article
  @article = Article.find(params[:id])
  end

end
