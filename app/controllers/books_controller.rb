class BooksController < ApplicationController

  def top
    redirect_to books_path(book.id)
  end

  def book
  end

  def index
    @books = Book.all
    @book = Book.new
    #redirect_to book_path(book.id)
    #redirect_to edit_book_path(book.id)
  end

  def show
    #edirect_to books_path(book.id)
    #redirect_to edit_book_path(book.id)
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book.id), notice: 'Book was successfully created'
    else
      @books = Book.all
      render "index"
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    if @book.save
      redirect_to book_path(@book.id), notice: 'Book was successfully updated'
    else
      render "edit"
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title,:body)
  end

end
