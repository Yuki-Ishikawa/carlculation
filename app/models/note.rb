class Note < ApplicationRecord
	has_many :note_comments, dependent: :destroy
	has_many :clips, dependent: :destroy
	belongs_to :user
	attachment :image

	def self.search(search)
		if search
			Note.where(['title LIKE ?', "%#{search}%"]).or(Note.where(['introduction LIKE ?', "%#{search}%"]))
			# or検索するときは各カラムに対して"モデル名.where"で指示してあげる必要がある
		else
			Note.all
		end
	end

	def cliped_by?(user)
        clips.where(user_id: user.id).exists?
    end
end
