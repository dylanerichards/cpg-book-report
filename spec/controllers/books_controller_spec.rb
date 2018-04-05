require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  let(:format) { Format.create(name: "Digital") }
  let(:author) { Author.create(name: "Suzi") }

  describe "GET #index" do

    it "returns all the books" do
      book = Book.create(title: "Book", release_date: 3.months.from_now, format: format )
      book2 = Book.create(title: "Book", release_date: 3.months.from_now, format: format)

      get :index

      expect(assigns(:books)).to eq [book, book2]
    end
  end

  describe "GET #show" do
    it "returns the book for the given id" do
      book = Book.create(title: "Book", release_date: 3.months.from_now, format: format)

      get :show, params: { id: book.id }

      expect(assigns(:book)).to eq book
    end
  end

  describe "GET #edit" do
    it "returns the book for the given id" do
      book = Book.create(title: "Book", release_date: 3.months.from_now, format: format)

      get :edit, params: { id: book.id }

      expect(assigns(:book)).to eq book
    end
  end

  describe "GET #new" do
    it "assigns @books to a new book" do
      get :new

      expect(assigns(:book)).to be_a_new Book
    end
  end

  describe "PUT #update" do
    it "updates the book" do
      book = Book.create(
        title: "Title",
        base_price: 10,
        release_date: Date.strptime("04/26/2018", "%m/%d/%Y"),
        authors: [author],
        format_id: format.id,
      )

      put :update, params: { "id" => Book.last.id, "book" => { "title" => "New Title", "base_price" => 10.00 , "release_date" => "04/26/2018", "authors" => [author.id], "format" => format.id } }

      expect(Book.last.title).to eq "New Title"
    end
  end

  describe "POST #create" do
    it "creates a new book" do

      expect{
        post :create, params: { "book" => { "title" => "Book", "base_price" => 10.00 , "release_date" => ("04/26/2018"), "format" => format.id, "authors" => [author.id.to_s] } }
      }.to change(Book, :count).by 1
    end
  end
end
