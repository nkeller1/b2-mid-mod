require 'rails_helper'


RSpec.describe Actor, type: :feature do
  describe "actor show page" do
    it "can see the actors information" do
      studio_1 = Studio.create(name: "Theee Studio")

      movie_1 = Movie.create(name: "Backlash", studio: studio_1)
      movie_2 = Movie.create(name: "Frontlash", studio: studio_1)

      actor_1 = Actor.create(name: "Bruce Willis", age: 60)

      actor_1.movies << [movie_1, movie_2]

      visit "/actors/#{actor_1.id}"

      expect(page).to have_content(actor_1.name)
      expect(page).to have_content(actor_1.age)
      expect(page).to have_content(movie_1.name)
      expect(page).to have_content(movie_2.name)
    end
  end
end

# As a user,
# When I visit an actor's show page,
# I see their name, their age, and a list of the names of all of the movies they are in.
