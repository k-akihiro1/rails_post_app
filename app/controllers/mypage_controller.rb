class MypageController < ApplicationController
  def show
    @articles = current_user.articles
  end
end
