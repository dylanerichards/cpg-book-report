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

  def edit
    @book = Book.find(params[:id])
  end

  def create
    book = Book.new
    bp = book_params

    book.assign_attributes(title: bp[:title],
                           release_date: parse_release_date,
                           format_id: bp[:format],
                           base_price: bp[:base_price]
                          )


    if book.save
      assign_authors(book)
      redirect_to(book)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def update
    book = Book.find(params[:id])

    bp = book_params
    book.assign_attributes(title: bp[:title],
                           release_date: parse_release_date,
                           format_id: bp[:format],
                           base_price: bp[:base_price]
                          )

    assign_authors(book)

    if book.save
      redirect_to book
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def parse_release_date
    release_date_param = book_params[:release_date]
    date = Date.strptime(release_date_param, "%m/%d/%Y")
  end

  def assign_authors(book)
    authors = author_params.map { |id| Author.find(id) }
    authors.each { |author| Authorship.create(book_id: book.id, author_id: author.id) if !book.authors.include?(author) }

    unselected_authors = Author.all - authors
    unselected_authors.each { |author| Authorship.where(book_id: book.id, author_id: author.id).destroy_all }

    book.save
  end

  def book_params
    params.require(:book).permit(:title, :base_price, :release_date, :format, authors: [])
  end

  def author_params
    book_params[:authors].delete_if { |param| param.empty?  }
  end
end
