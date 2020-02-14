class Actor < ApplicationRecord
  has_many :movies
  has_many :actor_movies
end
