class FavoritesController < ApplicationController
	def create
		favorite = Favorite.new
		favorite.user_id = current_user.id
		favorite.book_id = params[:book_id]
		favorite.save
		redirect_back fallback_location: root_path
	end

	def destroy
		favorite = current_user.favorites.find_by(book_id: params[:book_id])
		favorite.destroy
		redirect_back fallback_location: root_path
	end
end
