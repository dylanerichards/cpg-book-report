class Author < ApplicationRecord
  validates_uniqueness_of :name
  has_many :authorships
end
