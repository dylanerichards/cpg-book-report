class ReportsController < ApplicationController
  def index
    @books = Book.hardcover_from_2018
  end
end
