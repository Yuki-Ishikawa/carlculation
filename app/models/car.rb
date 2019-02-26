class Car < ApplicationRecord
	belongs_to :user
	attachment :image

	def self.search(search)
		if search
			Car.where(['car_model LIKE ?', "%#{search}%"])
		else
			Car.all
		end
	end

	enum maker:{"トヨタ/レクサス": 0, "日産":1, "ホンダ":2, "スバル":3, "マツダ":4, "三菱":5, "スズキ":6, "ダイハツ":7}
	enum color:{"ホワイト": 0, "ブラック":1, "シルバー":2, "ブルー":3, "レッド":4, "ブラウン":5, "グレー":6, "イエロー":7, "グリーン":8, "その他":9}
end
