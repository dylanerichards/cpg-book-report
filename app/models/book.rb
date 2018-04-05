class Book < ApplicationRecord
  validates_presence_of :title, :release_date

  before_save :check_release_date

  has_many :authorships
  has_many :authors, through: :authorships
  belongs_to :format

  def self.hardcover_from_2018
    select { |book| (book.release_date.year == 2018) && book.format.name == "Hardcover" }
  end

  private

  def check_release_date
    if  (release_date < Date.today + 2.months) && base_price.blank?
      errors.add(:base_price, "base_price can't be blank when the release date is less than 2 months away.")
      throw(:abort)
    end
  end

end
