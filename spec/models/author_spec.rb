require 'rails_helper'

describe Author do
  it { should validate_uniqueness_of :name }
end
