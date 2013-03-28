class NotesController < ApplicationController

	def index
		@notes = Note.order("created_at DESC").limit(5)
	end

	def create
		@note = Note.create(params[:note])

		if @note.save
			redirect_to root_path, notice: "Note created."
		else
			redirect_to root_path, alert: "Error creating note."
		end
	end

	def destroy
		@note = Note.find(params[:id])
		@note.destroy
	end

end
