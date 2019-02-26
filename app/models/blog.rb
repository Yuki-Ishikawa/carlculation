class Blog < ApplicationRecord
	has_many :blog_comments
	belongs_to :user
	attachment :image

	def self.search(search)
		if search
			Blog.where(['title LIKE ?', "%#{search}%"]).or(Blog.where(['introduction LIKE ?', "%#{search}%"]))
			# or検索するときは各カラムに対して"モデル名.where"で指示してあげる必要がある
		else
			Blog.all
		end
	end
end
