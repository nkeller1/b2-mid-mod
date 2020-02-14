require 'rails_helper'


RSpec.describe Actor, type: :feature do
  describe "actor show page" do
    it "can see the actors information" do
      studio_1 = Studio.create(name: "Theee Studio")

      movie_1 = Movie.create(name: "Backlash", genre: "action", year: 2019, studio: studio_1)

      actor_1 = Actor.create(name: "Bruce Willis", age: 60)
      actor_2 = Actor.create(name: "J-Law", age: 20)

      movie_1.actors << [actor_1, actor_2]

      visit "/movies/#{movie_1.id}"

      expect(page).to have_content(movie_1.name)
      expect(page).to have_content(movie_1.year)
      expect(page).to have_content(movie_1.genre)
      expect(page).to have_content(actor_1.name)
      expect(page).to have_content(actor_2.name)

      expect(page).to have_content("Average Actor Age: 40")
    end

    it "can fill in a form for an actors name" do
      studio_1 = Studio.create(name: "Theee Studio")

      movie_1 = Movie.create(name: "Backlash", genre: "action", year: 2019, studio: studio_1)

      actor_1 = Actor.create(name: "Bruce Willis", age: 60)
      actor_2 = Actor.create(name: "J-Law", age: 20)

      movie_1.actors << [actor_1]

      visit "/movies/#{movie_1.id}"

      expect(page).to have_content(actor_1.name)
      expect(page).to_not have_content(actor_2.name)

      fill_in :name, with: actor_2.name
      click_on "Add Actor to Movie"

      expect(current_path).to eq("/movies/#{movie_1.id}")
      expect(page).to have_content(actor_2.name)
    end
  end
end



# Story 4
# As a user,
# When I visit a movie show page,
# I see a form for an actors name
# and when I fill in the form with an existing actor's name
# I am redirected back to that movie's show page
# And I see the actor's name listed
# (This should not break story 3, You do not have to test for a sad path)
