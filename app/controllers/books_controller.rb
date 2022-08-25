class BooksController < ApplicationController
  before_action :set_book, only: [:edit, :update, :show, :destory]

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.create(book_params)
    if @book.save
      flash[:errors] = "Book has been Created Succesfully"
      redirect_to books_path
    else
      flash[:errors] = @book.errors.full_messages
      redirect_to new_book_path
    end
  end

  def show
  end

  def edit
  end

  def update
    if @book.update(book_params)
      flash[:errors] = "Book has been Updated Successfully"
      redirect_to book_path(@book)
    else
      flash[:errors] = @book.errors.full_messages
      redirect_to edit_book_path
    end
  end

  def destroy
    @book.destroy
    redirect_to books_path, notice: "Book has been successfully destroyed."
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:name, :author, :price, :cover_page)
  end
end
