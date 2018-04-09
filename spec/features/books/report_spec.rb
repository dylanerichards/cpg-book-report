require "rails_helper"

describe "the report" do
  before(:each) do
    hardcover = Format.create(name: "Hardcover")
    softcover = Format.create(name: "Softcover")

    book1 = Book.create(
      title: "Man's Search for Meaning",
      release_date: 3.months.from_now,
      format: hardcover
    )

    book2 = Book.create(
      title: "Ogilvy on Advertising",
      release_date: 3.months.from_now,
      format: hardcover
    )

    book3 = Book.create(
      title: "The $100 Startup",
      release_date: 3.months.from_now,
      format: softcover
    )
  end

  it 'shows hardcover books from 2018' do
    visit "/report"

    expect(page).to have_content "Ogilvy on Advertising"
    expect(page).to have_content "Man's Search for Meaning"

    expect(page).to_not have_content "The $100 Startup"
  end
end
