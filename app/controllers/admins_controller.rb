class AdminsController < ApplicationController
  def user_index
  	@users = User.page(params[:page]).reverse_order
  end
end
