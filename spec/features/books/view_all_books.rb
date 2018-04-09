require "rails_helper"

describe "viewing all books" do
  before(:each) do
    format = Format.create(name: "Hardcover")

    book1 = Book.create(
      title: "Man's Search for Meaning",
      release_date: 3.months.from_now,
      format: format
    )
  end

  it 'displays the titles of the books in the database' do
    visit "/"

    expect(page).to have_content "Man's Search for Meaning"
  end
end
