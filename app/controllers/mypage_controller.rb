class MypageController < ApplicationController
  def show
    @articles = current_user.articles.page(params[:page]).per(10)
  end
end
