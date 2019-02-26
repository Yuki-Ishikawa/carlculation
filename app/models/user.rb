class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    has_many :cars, dependent: :destroy
	has_many :blogs, dependent: :destroy
	has_many :notes, dependent: :destroy
	has_many :blog_comments, dependent: :destroy
	has_many :note_comments, dependent: :destroy
	has_many :clips, dependent: :destroy

	attachment :profile_image

	def self.search(search)
		if search
			User.where(['user_name LIKE ?', "%#{search}%"])
		else
			User.all
		end
	end

	enum user_address:{"非公開":0, "北海道":1, "青森県":2, "岩手県":3, "宮城県":4, "秋田県":5, "山形県":6, "福島県":7, "茨城県":8, "栃木県":9, 
		"群馬県":10, "埼玉県":11, "千葉県":12, "東京都":13, "神奈川県":14, "新潟県":15, "富山県":16, "石川県":17, "福井県":18, "山梨県":19, 
		"長野県":20, "岐阜県":21, "静岡県":22, "愛知県":23, "三重県":24, "滋賀県":25, "京都府":26, "大阪府":27, "兵庫県":28, "奈良県":29, 
		"和歌山県":30, "鳥取県":31, "島根県":32, "岡山県":33, "広島県":34, "山口県":35, "徳島県":36, "香川県":37, "愛媛県":38, "高知県":39, 
		"福岡県":40, "佐賀県":41, "長崎県":42, "熊本県":43, "大分県":44,"宮崎県":45, "鹿児島県":46, "沖縄県":47}
	enum sex:{"Male": 0, "Female":1}
	enum job:{"IT関連": 0, "事務":1, "技術・開発":2, "営業・企画":3, "クリエイター":4, "販売・ショップ":5, "サービス業":6, "製造・設備":7, "土木・建築":8, "公務員":9, 
		"教職員":10, "役員・管理職":11, "アーティスト":12, "医療機関":13, "弁護士・会計士":14, "大学生・院生":15, "専門学校":16, "主婦":17, "フリーター":18, "その他":19}


end
