class SnippetsController < ApplicationController

	before_action :find_snippet, only: [:show, :edit, :update, :destroy, :upvote, :dislike, :unvote]
	before_action :authenticate_user!, only: [:index, :show]
    before_action :authorized_user, only: [:edit, :update, :destroy]

	def index
		if params[:category].blank?
			@snippets = Snippet.all.desc
			if params[:search]
				@snippets = Snippet.search(params[:search]).desc
  			elsif
    			@snippets = Snippet.all.desc
    		end
		else 
			@category_id = Category.find_by(name: params[:category]).id
			@snippets = Snippet.where(category_id: @category_id).desc
		end
	end

	def show
	end

	def home
		@randomSnippet = Snippet.random
		@upvotedSnippet = Snippet.upvotedSnippet
		@totalVotes = Snippet.totalVotes
		@totalUpVotes = Snippet.totalUpVotes
		@totalDownVotes = Snippet.totalDownVotes
	end

	def new
		@snippet = current_user.snippets.build
	end

	def create
		@snippet = current_user.snippets.build(snippets_params)

		if @snippet.save
			redirect_to @snippet
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @snippet.update(snippets_params)
			redirect_to @snippet
		else
			render 'edit'
		end
	end

	def destroy
		@snippet.destroy
		redirect_to root_path
	end

	def upvote
		@snippet.upvote_by current_user
		@snippet.user.increase_rep
		redirect_to :back
	end

	def dislike
        @snippet.downvote_by current_user
        @snippet.user.decrease_rep
        redirect_to :back
    end

    def unvote
    	@snippet.unvote_by current_user
    	@snippet.user.decrease_rep
    	redirect_to :back
  	end

	private

	def snippets_params
		params.require(:snippet).permit(:title, :css, :html, :javascript, :ruby, :python, :category_id, :search)
	end

	def find_snippet
		@snippet = Snippet.find(params[:id])
	end

	def authorized_user
        unless current_user.admin?
        	@snippet = current_user.snippets.find_by(id: params[:id])
        	redirect_to root_path if @snippet.nil?
        end
    end

end
