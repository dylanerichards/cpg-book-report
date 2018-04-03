class Book < ApplicationRecord
  validates_presence_of :title, :release_date

  before_save :check_release_date

  has_one :format

  private

  def check_release_date
    if  (release_date < Date.today + 2.months) && base_price.blank?
      errors.add(:base_price, "base_price can't be blank when the release date is less than 2 months away.")
      throw(:abort)
    end
  end

end
