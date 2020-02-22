class FavoritesController < ApplicationController
	def create
		favorite = Favorite.new
		favorite.user_id = current_user.id
		favorite.book_id = params[:book_id]
		favorite.save
		redirect
	end

	def destroy
		favorite = current_user.favorites.find_by(book_id: params[:book_id])
		favorite.destroy
		redirect
	end

	def redirect
		case params[:redirect_id].to_i
		when 0
			redirect_to books_path
		when 1
			redirect_to book_path(params[:book_id])
		end
	end
end
