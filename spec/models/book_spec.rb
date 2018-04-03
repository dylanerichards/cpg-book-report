require 'rails_helper'

describe Book  do
  it { should validate_presence_of(:title)  }
  it { should validate_presence_of(:release_date)  }

  it 'will not save without a base price if the release date is within 2 months' do
    book = Book.create(title: "Book", release_date: 1.months.from_now)

    expect {
      book
    }.to change(Book, :count).by 0

    expect(book.errors[:base_price]).to include "base_price can't be blank when the release date is less than 2 months away."
  end


  it 'saves without a base price if the release date is greater than 2 months out' do
    expect {
      Book.create(title: "Book", release_date: 3.months.from_now)
    }.to change(Book, :count).by 1
  end

  it 'saves with a base price' do
    expect {
      Book.create(title: "Book", release_date: 1.months.from_now, base_price: 1.00)
    }.to change(Book, :count).by 1

    expect {
      Book.create(title: "Book", release_date: 3.months.from_now, base_price: 1.00)
    }.to change(Book, :count).by 1
  end
end
