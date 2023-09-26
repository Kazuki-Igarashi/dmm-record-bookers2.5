class BooksController < ApplicationController
before_action :ensure_correct_user, only: [:edit, :update]

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @find_book = Book.new
    @book_comment = BookComment.new
  end

  def index
    @books = Book.page(params[:page]).reverse_order
    @book = Book.new
    @user = current_user
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @books = Book.all
    @user = @book.user
    if @book.save
      redirect_to book_path(@book)
      flash[:notice] = 'Book create successfully'
    else
      @books = Book.all
      flash[:alert] = 'Book not create successfully'
      render 'index'
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = 'Book update successfully'
      redirect_to book_path(@book)
    else
      render "edit"
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
    flash[:notice] = "Book was successfully destroyed."
  end

  #   def search
  #   @user = User.find(params[:user_id])
  #   @books_search = @user.books
  #   @book = Book.new
  #   if params[:created_at] == ""
  #     @search_book = "日付を選択してください。"
  #   else
  #     create_at = params[:created_at]
  #     @search_book = @books.where(['created_at LIKE?', "#{create_at}%"]).count
  #   end
  # end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
  
  def ensure_correct_user
    user = Book.find(params[:id]).user
    unless user == current_user
      redirect_to books_path
    end
  end
  
end
