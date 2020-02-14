class Movie < ApplicationRecord
  validates_presence_of :name
  has_one :studio
end
