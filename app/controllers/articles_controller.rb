class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :destroy]
  def index
    @articles = Article.all.page(params[:page]).per(10)
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
  end

    # PATCH/PUT /sample_articles/1 or /sample_articles/1.json
  def update
    if @article.update(article_params)
      redirect_to article_url(@article), notice: "#{t('activerecord.models.article')}を編集しました。"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_url, notice: "#{t('activerecord.models.article')}を削除しました。"
  end

  def search
    articles = Article.all
    if params[:title].present?
      articles = articles.where("title like? ", "%#{params[:title]}%" )
      @articles = articles.all.page(params[:page]).per(10)
      # redirect_to articles_path(@articles)
      render "index"
    end

  end

  private
    def article_params
      params.require(:article).permit(:title, :content, tag_ids: [] )
    end

    def set_article
      @article = current_user.articles.find(params[:id])
    end
end
