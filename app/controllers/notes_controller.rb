class NotesController < ApplicationController
  	def new
  		@note = Note.new
  	end

  	def create
  		@note = Note.new(note_params)
  		@note.user_id = current_user.id
  		if
  			@note.save
  			redirect_to note_path(@note.id)
  		else
  			puts @note.errors.full_messages
  			render action: 'new'
  		end
  	end

  	def show
  		@note = Note.find(params[:id])
  		@note_comment = NoteComment.new
  	end

  	def edit
  		@note = Note.find(params[:id])
  	end

  	def update
  		@note = Note.find(params[:id])
  		if
  			@note.update(note_params)
  			redirect_to note_path(@note.id)
  		else
  			puts @note.errors.full_messages
  			render action: 'edit'
  		end
  	end

  	def index
  		@notes = Note.page(params[:page]).reverse_order
  	end

  	def destroy
  		user = current_user.id
    	note = Note.find(params[:id])
    	note.destroy
    	redirect_to user_path(current_user.id)
  	end

  	private
  	def note_params
  		params.require(:note).permit(:user_id, :title, :introduction, :image)
  	end

end
