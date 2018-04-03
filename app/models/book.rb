class Book < ApplicationRecord
  validates_presence_of :title

  has_one :format

end
