class Calculation < ApplicationRecord
	def total_price(calc_price)
		calc_price.displacement + (calc_price.weight / 2) + [(calc_price.distance / calc_price.consumption) * calc_price.gasoline] + calc_price.insurance + (calc_price.inspection / 2)
	end

	def car_tax
		price * 0.03
	end
end
