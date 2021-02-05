class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to @book, notice: "#{@book.title} Created."
    else
      render :new
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
      redirect_to @book, flash: {notice: "#{@book.title} Updated."}
    else
      render :edit
    end
  end

  def delete
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    redirect_to root_path, notice: "#{@book.title} Destroyed."
    @book.destroy

  end

  private
    def book_params
      params.require(:book).permit(:title, :author, :genre, :price, :published_date)
    end
end
