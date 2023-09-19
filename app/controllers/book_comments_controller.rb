class BookCommentsController < ApplicationController

  def create
    book = Book.find(params[:book_id])
    comment = BookComment.new(book_comment_params)
    comment.user_id = current_user.id
    comment.book_id = book.id
    comment.save
    flash[:notice] = 'Comment create successfully'
    redirect_to request.referer
  end

  def destroy
    @book_comment = BookComment.find(params[:id])
    @book_comment.destroy
    redirect_to request.referer
    flash[:alert] = "Book was successfully destroyed."
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

end
