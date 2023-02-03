3.times do |u|
	user = User.find_or_create_by(email: "user00#{u+1}@example.com") do |user|
    user.password = "password"
	end

		50.times do |a|
      user.articles.find_or_create_by(title: "No.#{a+1}: user00#{u+1}の記事") do |article|
        article.content = "No.#{a+1}: user00#{u+1}の記事の本文"
      end
		end
end
