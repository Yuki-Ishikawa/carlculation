class Calculation < ApplicationRecord
	def total_price(calc_price)
		calc_price.displacement + (calc_price.weight / 2) + [(calc_price.distance / calc_price.consumption) * calc_price.gasoline] + calc_price.insurance + (calc_price.inspection / 2)
	end

	def car_tax
		price * 0.03
	end

	validates :displacement, presence: true
	validates :weight, presence: true
	validates :distance, presence: true
	validates :gasoline, presence: true
	validates :consumption, presence: true
	validates :insurance, presence: true
	validates :inspection, presence: true
	validates :parking, presence: true
	validates :price, presence: true
end
