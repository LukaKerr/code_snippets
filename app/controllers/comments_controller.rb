class CommentsController < ApplicationController
	before_action :find_comment, only: [:show, :edit, :update, :destroy, :upvote, :dislike, :unvote]
	before_action :authenticate_user!

	def index
		@comments = Comment.all
	end

	def show
	end

	def new
		@comment = Comment.new
	end

	def edit
	end

	def create
		@snippet = Snippet.find(params[:snippet_id])
		@comment = @snippet.comments.new(comment_params)
		@comment.user = current_user

		respond_to do |format|
			if @comment.save
				format.html { redirect_to @snippet, notice: 'Comment successfully created.' }
				format.json { render json: @comment, status: :created, location: @comment }
			else
				format.html { render action: 'new' }
				format.json { render json: @comment.errors, status: :unprocessable_entity }
			end
		end
	end

	def update
		@snippet = Snippet.find(params[:snippet_id])
		respond_to do |format|
			if @comment.update(comment_params)
				format.html { redirect_to @snippet, notice: "Comment successfully updated." }
				format.json { render :show, status: :ok, location: @comment }
			else
				format.html { render :edit }
				format.json { render json: @comment.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@comment.destroy
		respond_to do |format|
			format.html { redirect_to :back, notice: 'Comment successfully deleted.' }
			format.json { head :no_content }
		end
	end

	def upvote
		@comment.upvote_by current_user
		redirect_to :back
	end

	def dislike
		@comment.downvote_by current_user
		redirect_to :back
	end

	def unvote
		@comment.unvote_by current_user
		redirect_to :back
	end

	private
	def find_comment
		@comment = Comment.find(params[:id])
	end

	def comment_params
		params.require(:comment).permit(:snippet_id, :body, :user_id)
	end
end