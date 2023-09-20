class BookCommentsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    @book_comment = BookComment.new(book_comment_params)
    @book_comment.user_id = current_user.id
    @book_comment.book_id = @book.id
    @book_comment.save
    flash[:notice] = 'Comment create successfully'
    # 非同期通信の為コメントアウト
    # redirect_to request.referer
  end

  def destroy
    @book_comment = BookComment.find(params[:id])
    @book_comment.destroy
    # 非同期通信の為コメントアウト
    # redirect_to request.referer
    flash[:alert] = "Book was successfully destroyed."
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

end
