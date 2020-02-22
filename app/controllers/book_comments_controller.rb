class BookCommentsController < ApplicationController
	def create
		@book_comment = BookComment.new(book_params)
		@book_comment.user_id = current_user.id
		@book_comment.book_id = params[:book_id]
		if @book_comment.save
			redirect_back fallback_location: root_path, notice: "successfully submitted comment!"
		else
    		@book = Book.find(params[:book_id])
			render "books/show"
		end
	end

	def destroy
		book_comment = current_user.book_comments.find_by(book_id: params[:book_id], id: params[:id])
		book_comment.destroy
		redirect_back fallback_location: root_path
	end

	private
	def book_params
		params.require(:book_comment).permit(:comment)
	end
end
