class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters, if: :devise_controller?

	def after_inactive_sign_up_path_for(resource)
    	cars_top_path
      # 新規登録後のリダイレクト先を指定
  	end

  	def after_sign_in_path_for(resource)
  		cars_top_path
      # ログイン後のリダイレクト先を指定
  	end

  	def after_sign_out_path_for(resource)
    	cars_top_path
      # ログアウト後のリダイレクト先を指定
  	end

  	def configure_permitted_parameters
    	devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name, :blog_title])
      # 新規登録時に必要になる情報を追加
  	end
end
