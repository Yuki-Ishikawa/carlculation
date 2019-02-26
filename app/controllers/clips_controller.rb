class ClipsController < ApplicationController
	def create
		@note = Note.find(params[:note_id])
		@clip = current_user.clips.new(note_id: @note.id, user_id: @user.id)
		@clip.save
		redirect_to note_path(@note.id)
	end

	def destroy
		@note = Note.find(params[:note_id])
		@clip = current_user.clips.find_by(note_id: @note.id)
		@clip.destroy
		redirect_to note_path(@note.id)
	end
  	def index
  		@user = current_user
  		@clip = Clip.where(user_id: @user.id).all
  	end
end
