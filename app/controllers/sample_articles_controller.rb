class SampleArticlesController < ApplicationController
  before_action :set_sample_article, only: %i[ show edit update destroy ]

  # GET /sample_articles or /sample_articles.json
  def index
    @sample_articles = SampleArticle.all
  end

  # GET /sample_articles/1 or /sample_articles/1.json
  def show
  end

  # GET /sample_articles/new
  def new
    @sample_article = SampleArticle.new
  end

  # GET /sample_articles/1/edit
  def edit
  end

  # POST /sample_articles or /sample_articles.json
  def create
    @sample_article = SampleArticle.new(sample_article_params)

    respond_to do |format|
      if @sample_article.save
        format.html { redirect_to sample_article_url(@sample_article), notice: "Sample article was successfully created." }
        format.json { render :show, status: :created, location: @sample_article }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sample_article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sample_articles/1 or /sample_articles/1.json
  def update
    respond_to do |format|
      if @sample_article.update(sample_article_params)
        format.html { redirect_to sample_article_url(@sample_article), notice: "Sample article was successfully updated." }
        format.json { render :show, status: :ok, location: @sample_article }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sample_article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sample_articles/1 or /sample_articles/1.json
  def destroy
    @sample_article.destroy

    respond_to do |format|
      format.html { redirect_to sample_articles_url, notice: "Sample article was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sample_article
      @sample_article = SampleArticle.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sample_article_params
      params.require(:sample_article).permit(:title, :content)
    end
end
