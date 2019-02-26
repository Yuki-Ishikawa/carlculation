class NoteCommentsController < ApplicationController
	def create
		@note = Note.find(params[:note_id])
		@note_comment = current_user.note_comments.new(note_comment_params)
		@note_comment.note_id = @note.id
		@note_comment.save
		redirect_to note_path(@note.id)
	end

	def destroy
		@note = Note.find(params[:note_id])
		@note_comment = current_user.note_comments.find_by(note_id: @note.id)
		@note_comment.destroy
		redirect_to note_path(@note.id)
	end

	private
	def note_comment_params
		params.require(:note_comment).permit(:user_id, :note_id, :comment)
	end
end
