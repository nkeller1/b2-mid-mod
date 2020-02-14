RSpec.describe Studio, type: :feature do
  describe "studio index page" do
    it "can see a list of all of the movie studios" do
      studio_1 = Studio.create(name: "Theee Studio")
      studio_2 = Studio.create(name: "A Different Studio")

      movie_1 = Movie.create(name: "Backlash", studio: studio_1)
      movie_2 = Movie.create(name: "Frontlash", studio: studio_1)
      movie_3 = Movie.create(name: "Hello Kitty", studio: studio_2)

      visit "/studios"

     within "#studio-#{studio_1.id}" do
       expect(page).to have_content(studio_1.name)
       expect(page).to have_content(movie_1.name)
       expect(page).to have_content(movie2.name)
     end

     within "#studio-#{studio_2.id}" do
       expect(page).to have_content(studio_2.name)
       expect(page).to have_content(movie_3.name)
     end

     
    end
  end
end



#
# Story 1
# As a user,
# When I visit the studio index page
# I see a list of all of the movie studios
# And underneath each studio,
# I see the names of all of its movies.
