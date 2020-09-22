class BookCommentsController < ApplicationController

	def create
    	book = Book.find(params[:book_id])
    	comment = current_user.book_comments.new(book_comment_params)
    	comment.book_id = book.id
    	comment.save
    	redirect_to book_path(book)
  	end

  	def destroy
    	@book = Book.find(params[:book_id])
    	if book_comment =current_user.book_comments.find_by(id:params[:id],book_id:@book.id)
    	book_comment.destroy
    	redirect_to request.referer#遷移先
    	else
    	redirect_to request.referer#遷移先
    	end
    end

  private

  	def book_comment_params
    	params.require(:book_comment).permit(:comment)
  	end

  	def baria_user
    comment = BookComment.find(params[:id])
  	unless comment.user_id == current_user.id
  		redirect_to user_path(current_user)
  	end
   end
end
