class MypageController < ApplicationController
  def show
    @articles = current_user.articlesß
  end
end
