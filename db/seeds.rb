# タグの作成
tags = ["プログラミング", "ハイキング", "趣味", "仕事", "その他"]
tags.each { |tag| Tag.find_or_create_by!(name: tag) }


3.times do |u|
	user = User.find_or_create_by(email: "user00#{u+1}@example.com") do |user|
    user.password = "password"
	end

		50.times do |a|
      user.articles.find_or_create_by(title: "No.#{a+1}: user00#{u+1}の記事") do |article|
        article.content = "No.#{a+1}: user00#{u+1}の記事の本文"
        article.tag_ids = Tag.all.pluck(:id).sample
      end
		end
end
