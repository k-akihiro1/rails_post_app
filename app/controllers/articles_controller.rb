class ArticlesController < ApplicationController
  # before_action :set_article, only: [:show, :edit, :update, :destroy]
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.new(article_params)
    if @article.save
      redirect_to article_path(@article), notice: "#{t('activerecord.models.article')}を作成しました。"
    else
      render action: :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = current_user.articles.find(params[:id])
  end

    # PATCH/PUT /sample_articles/1 or /sample_articles/1.json
  def update
    @article = current_user.articles.find(params[:id])
    if @article.update(article_params)
      redirect_to article_url(@article), notice: "#{t('activerecord.models.article')}を編集しました。"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = current_user.articles.find(params[:id])
    @article.destroy
    redirect_to articles_url, notice: "#{t('activerecord.models.article')}を削除しました。"
  end

  private
    def article_params
      params.require(:article).permit(:title, :content)
    end

    def set_article
      # @article = Article.find(params[:id])
    end
end
