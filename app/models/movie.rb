class Movie < ApplicationRecord
  validates_presence_of :name
  belongs_to :studio
  has_many :actor_movies
  has_many :actors, through: :actor_movies
end
