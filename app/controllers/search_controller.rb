class SearchController < ApplicationController
	def index
		@table_name = params[:table_name]

		if 	@table_name == 'Blog'
			@searched = Blog.search(params[:search]).page(params[:page])

		elsif @table_name == 'Note'
			@searched = Note.search(params[:search]).page(params[:page])

		elsif @table_name == 'Car'
			@searched = Car.search(params[:search]).page(params[:page])
			
		else
			@searched = User.search(params[:search]).page(params[:page])
		end
	end
end
