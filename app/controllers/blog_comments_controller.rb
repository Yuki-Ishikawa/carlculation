class BlogCommentsController < ApplicationController
	def create
		@blog = Blog.find(params[:blog_id])
		# idを元に取り出し
		@blog_comment = current_user.blog_comments.new(blog_comment_params)
		# blog_commentを現在のユーザーで新規作成
		@blog_comment.blog_id = @blog.id
		# コメントを作成したblog_idを@blog.idと定義
		@blog_comment.save
		# コメントをデータベースに保存
		redirect_to blog_path(@blog.id)
		# コメントを作成した記事のページにリダイレクト
	end

	def destroy
		@blog = Blog.find(params[:blog_id])
		# idを元に取り出し
		@blog_comment = current_user.blog_comments.find_by(blog_id: @blog.id)

		@blog_comment.destroy
		# コメントをデータベースから削除
		redirect_to blog_path(@blog.id)
		# コメントを削除した記事のページにリダイレクト
	end

	private
	def blog_comment_params
		params.require(:blog_comment).permit(:user_id, :blog_id, :comment)
	end
end
