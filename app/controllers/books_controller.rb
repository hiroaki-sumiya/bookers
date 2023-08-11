class BooksController < ApplicationController
  def index
    self.new
    @books = Book.all
  end

  def create
    @book = Book.new list_params
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      @error = true
      render :index
    end
  end

  def show
    @book = from_id
  end

  def edit
    @book = from_id
  end

  def update
    @book = from_id
    if @book.update list_params
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(id)
    else
      @error = true
      render :edit
    end
  end

  def destroy
    book = from_id
    book.destroy
    flash[:notice] = "Book was successfully destroyed."
    redirect_to books_path
  end

  private
  def new
    @book = Book.new
  end

  def id
    params[:id]
  end

  def list_params
    params.require(:book).permit(:title, :body)
  end

  def from_id
    Book.find(id)
  end
end
