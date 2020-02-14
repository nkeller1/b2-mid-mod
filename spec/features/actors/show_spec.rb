require 'rails_helper'


RSpec.describe Actor, type: :feature do
  describe "actor show page" do
    it "can see the actors information" do
      studio_1 = Studio.create(name: "Theee Studio")

      movie_1 = Movie.create(name: "Backlash", genre: "action", year: 2019, studio: studio_1)
      movie_2 = Movie.create(name: "Frontlash", genre: "fantasy", year: 2012, studio: studio_1)

      actor_1 = Actor.create(name: "Bruce Willis", age: 60)

      actor_1.movies << [movie_1, movie_2]

      visit "/actors/#{actor_1.id}"

      expect(page).to have_content(actor_1.name)
      expect(page).to have_content(actor_1.age)
      expect(page).to have_content(movie_1.name)
      expect(page).to have_content(movie_2.name)
    end

    it "shows a unique list of all of the actors this actor has worked with" do
      studio_1 = Studio.create(name: "Theee Studio")

      movie_1 = Movie.create(name: "Backlash", genre: "action", year: 2019, studio: studio_1)
      movie_2 = Movie.create(name: "Frontlash", genre: "fantasy", year: 2012, studio: studio_1)

      actor_1 = Actor.create(name: "Bruce Willis", age: 60)
      actor_2 = Actor.create(name: "J-Law", age: 20)

      actor_1.movies << [movie_1, movie_2]
      actor_2.movies << [movie_1]

      visit "/actors/#{actor_1.id}"

      expect(page).to have_content("Actors #{actor_1.name} has worked with:")
      expect(page).to have_content(actor_2.name)
    end
  end
end
