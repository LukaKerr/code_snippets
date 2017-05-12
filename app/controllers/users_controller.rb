class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
		@snippets = @user.snippets.order(params[:sort])
	end

	def leaderboard
		@users = User.all.order("rep DESC")
		@rank = 0
	end

end
