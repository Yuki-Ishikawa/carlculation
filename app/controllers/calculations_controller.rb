class CalculationsController < ApplicationController
	def input
		@calculation = Calculation.new
		@total = 0
	end

	def output
		@calculation = Calculation.new(calculation_params)
		if @calculation.displacement <= 1000
			@displacement = 29500
		# 1000以下の場合29500
		elsif @calculation.displacement > 1000 && @calculation.displacement <= 1500
			@displacement = 34500
		# 1000を超え1500以下の場合34500
		elsif @calculation.displacement > 1500 && @calculation.displacement <= 2000
			@displacement = 39500
		# 1500を超え2000以下の場合39500
		elsif @calculation.displacement > 2000 && @calculation.displacement <= 2500
			@displacement = 45000
		# 2000を超え2500以下の場合45000
		elsif @calculation.displacement > 2500 && @calculation.displacement <= 3000
			@displacement = 51000
		# 2500を超え3000以下の場合51000
		elsif @calculation.displacement > 3000 && @calculation.displacement <= 3500
			@displacement = 58000
		# 3000を超え3500以下の場合58000
		elsif @calculation.displacement > 3500 && @calculation.displacement <= 4000
			@displacement = 66500
		# 3500を超え4000以下の場合66500
		elsif @calculation.displacement > 4000 && @calculation.displacement <= 4500
			@displacement = 76500
		# 4000を超え4500以下の場合76500
		elsif @calculation.displacement > 4500 && @calculation.displacement <= 6000
			@displacement = 88000
		# 4500を超え6000以下の場合88000
		elsif @calculation.displacement > 6000
			@displacement = 111000
		# それ以外(6000を超える)場合111000
		else
		end

		if @calculation.weight <= 500
			@weight = 8200
		elsif @calculation.weight > 500 && @calculation.weight <= 1000
			@weight = 16400
		elsif @calculation.weight > 1000 && @calculation.weight <= 1500
			@weight = 24600
		elsif @calculation.weight > 1500 && @calculation.weight <= 2000
			@weight = 32800
		elsif @calculation.weight > 2000 && @calculation.weight <= 2500
			@weight = 41000
		elsif @calculation.weight > 2500 && calculation.weight <= 3000
			@weight = 49200
		else
		end

		@one = @displacement + (@weight / 2)
		@two = @calculation.distance / @calculation.consumption
		@two = @two * @calculation.gasoline
		@three =  @calculation.insurance + (@calculation.inspection / 2) + (@calculation.parking * 12)
		@total = @one + @two.to_i + @three
		# 下記の式を3つに分解
		# 排気量ごとの定数 + (重量ごとの定数 / 2) + ((年間走行距離 / 燃費) * ガソリン代) + 自動車保険料 + (車検費用 / 2) + 駐車場代
		# calc_price.displacement + (calc_price.weight / 2) + ((calc_price.distance / calc_price.consumption) * calc_price.gasoline) + calc_price.insurance + (calc_price.inspection / 2) + (@calculation.parking * 12)

		@car_tax = @calculation.price * 0.03
		# 自動車種取得税の算出式(車両購入価格の3%が税金)
		if @calculation.price < 500000
			@car_tax = 0
		end
		# if以下は500000円未満は非課税の条件式
		render :output
	end

	private
	def calculation_params
		params.require(:calculation).permit(:displacement, :weight, :distance, :gasoline, :consumption, :insurance, :inspection, :parking, :price)
	end
end
