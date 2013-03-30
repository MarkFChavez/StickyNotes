class NotesController < ApplicationController

	before_filter :authenticate_user!, except: [:index, :show]
	before_filter :get_note, only: [:show, :destroy, :edit, :update]

	def get_note
		@note = Note.find(params[:id])
	end	

	def index
		@notes = Note.recent(5)
		@users = User.all
	end

	def show
		@comments = @note.comments.order("created_at ASC")
	end

	def create
		@note = Note.create(params[:note])
		@note.user = current_user

		if @note.save
			redirect_to root_path, notice: "Note created."
		else
			redirect_to root_path, alert: "Error creating note."
		end
	end

	def destroy
		@note.destroy
	end

	def edit
	end

	def update
		if @note.update_attributes(params[:note])
			redirect_to root_path, notice: "Note updated"
		else
			render "edit"
		end
	end

end
