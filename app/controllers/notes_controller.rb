class NotesController < ApplicationController

	before_filter :authenticate_user!, except: [:index]
	before_filter :get_note, only: [:show, :destroy, :edit, :update]

	def get_note
		@note = Note.find(params[:id])
	end	

	def index
		@notes = Note.public.recent
		@users = User.normal_users
		@admins = User.administrators
	end

	def show
		@comments = @note.comments.order("created_at ASC")
	end

	def create
		@note = current_user.notes.create(params[:note])

		if @note.save
			redirect_to root_path, notice: "Note created. View <a href=\"#{url_for(user_notes_notes_path)}\">here</a>".html_safe
		else
			redirect_to root_path, alert: "Error creating note."
		end
	end

	def destroy
		if @note.user == current_user or current_user.is_admin?
			@note.destroy
		else
			redirect_to root_path, alert: "Unable to delete"
		end
	end

	def edit
		if current_user != @note.user
			redirect_to root_path
		end
	end

	def update
		if @note.update_attributes(params[:note])
			redirect_to root_path, notice: "Note updated"
		else
			render "edit"
		end
	end

	def user_notes
		@notes = current_user.notes.recent
	end

	def change_note_visibility
		@note = Note.find(params[:id])

		if @note.public?
			@note.public = false
		else
			@note.public = true
		end

		if @note.save
			redirect_to user_notes_notes_path, notice: "Note marked!"
		else
			redirect_to user_notes_notes_path, alert: "Error marking note!"
		end
	end

end
