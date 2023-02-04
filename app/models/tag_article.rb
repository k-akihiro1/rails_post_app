class TagArticle < ApplicationRecord
  belongs_to :article
  belongs_to :tag
end
