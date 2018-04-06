require 'rails_helper'

describe Book  do
  it { should validate_presence_of(:title)  }
  it { should validate_presence_of(:release_date)  }
  it { should belong_to(:format)  }
  let(:format) { Format.create(name: "Hardcover") }

  it 'will not save without a base price if the release date is within 2 months' do
    book = Book.create(title: "Book", release_date: 1.months.from_now, format: format)

    expect {
      book
    }.to change(Book, :count).by 0

    expect(book.errors[:base_price]).to include "base_price can't be blank when the release date is less than 2 months away."
  end


  it 'saves without a base price if the release date is greater than 2 months out' do
    expect {
      Book.create(title: "Book", release_date: 3.months.from_now, format: format)
    }.to change(Book, :count).by 1
  end

  it 'saves with a base price' do
    expect {
      Book.create(title: "Book", release_date: 1.months.from_now, base_price: 1.00, format: format)
    }.to change(Book, :count).by 1

    expect {
      Book.create(title: "Book", release_date: 3.months.from_now, base_price: 1.00, format: format)
    }.to change(Book, :count).by 1
  end

  describe ".hardcover_from_2018" do
    let(:hardcover) { Format.create(name: "Hardcover") }
    let(:softcover) { Format.create(name: "Softcover") }

    it 'returns all the hardcover books released in 2018' do
      book1 = Book.create(title: "Hardcover", release_date: 1.months.from_now, base_price: 1.00, format: hardcover)
      book2 = Book.create(title: "Hardcover", release_date: 300.months.from_now, base_price: 1.00, format: softcover)

      expect(Book.hardcover_from_2018).to eq [book1]
    end
  end
end
