class BookCommentsController < ApplicationController
	before_action :set_book, only: [:create, :destroy]

	def create
		@book_comment = BookComment.new(book_comment_params)
		@book_comment.user_id = current_user.id
		@book_comment.book_id = params[:book_id]
		@book_comment.save
	end

	def destroy
		book_comment = current_user.book_comments.find_by(book_id: params[:book_id], id: params[:id])
		book_comment.destroy
	end

	private
	def set_book
    	@book = Book.find(params[:book_id])
	end

	def book_comment_params
		params.require(:book_comment).permit(:comment)
	end
end
