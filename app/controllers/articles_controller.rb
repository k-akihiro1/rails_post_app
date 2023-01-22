class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to article_path(@article), notice: "article was successfully created."
    else
      render action: :new, status: :unprocessable_entity
    end
  end

  def edit
  end

    # PATCH/PUT /sample_articles/1 or /sample_articles/1.json
  def update
    if @article.update(article_params)
      redirect_to article_url(@article), notice: "article was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_url, notice: "Sample article was successfully destroyed."
  end

  private
    def article_params
      params.require(:article).permit(:title, :content)
    end

    def set_article
      @article = Article.find(params[:id])
    end

end
