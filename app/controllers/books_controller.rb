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
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.color_pages.attach(params[:book][:color_pages])
    if @book.update(book_params_without_image)
      flash[:errors] = "Book has been Updated Successfully"
      redirect_to book_path(@book)
    else
      flash[:errors] = @book.errors.full_messages
      redirect_to edit_book_path
    end
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.delete
      flash[:errors] = "Book Deleted Successfully"
      redirect_to root_path(@book)
    else
      flash[:errors] = @book.errors.full_messages
      redirect_to destroy_book_path
    end
  end

  def delete_file
    file = ActiveStorage::Attachment.find(params[:id])
    file.purge
    redirect_back(fallback_location: books_path)
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params_without_image
    params.require(:book).permit(:name, :author, :price, :cover_page)
  end

  def book_params
    params.require(:book).permit(:name, :author, :price, :cover_page, color_pages: [])
  end
end
