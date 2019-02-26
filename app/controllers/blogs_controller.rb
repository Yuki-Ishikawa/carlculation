class BlogsController < ApplicationController
  	def new
  		@blog = Blog.new
      # 空のモデルをビューへ渡す
  	end
  
  	def create
  		@blog = Blog.new(blog_params)
  		@blog.user_id = current_user.id
      # 投稿するuser_idを現在のユーザーと定義
  		if
  			@blog.save
        # 作成したブログをデータエースに保存
  			redirect_to blog_path(@blog.id)
        # 作成した記事のページにリダイレクト
  		else
  			puts @blog.errors.full_messages
        # ターミナル側にエラーメッセージを表示させる記述
  			render action: 'new'
        # newアクションへ遷移
  		end
  	end

  	def show
  		@blog = Blog.find(params[:id])
      # idを元に取り出し
  		@blog_comment = BlogComment.new
      # 空のモデルをビューへ渡す
  	end

  	def edit
  		@blog = Blog.find(params[:id])
      # idを元に取り出し
      if @blog.user_id == current_user.id
        # ブログに紐づいたユーザーと現在ログインしているユーザーが一致すること
      else redirect_to blog_path(@blog.id)
      end
  	end

  	def update
  		@blog = Blog.find(params[:id])
      # idを元に取り出し
  		if
  			@blog.update(blog_params)
        # 更新した内容をデータベースへ上書き
  			redirect_to blog_path(@blog.id)
        # 更新した記事のページにリダイレクト
  		else
  			puts @blog.errors.full_messages
        # ターミナル側にエラーメッセージを表示させる記述
  			render action: 'edit'
        # editアクションへ遷移
  		end
  	end

  	def index
  		@blogs = Blog.page(params[:page]).reverse_order
      # データベース内のデータ全体を表示(kaminariでページング+作成日時の新しい順に表示)
  	end

  	def destroy
 		  user = current_user.id
    	blog = Blog.find(params[:id])
    	blog.destroy
    	redirect_to user_path(current_user.id)
  	end

  	private
  	def blog_params
  		params.require(:blog).permit(:user_id, :title, :introduction, :image)
  	end
end
