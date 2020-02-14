RSpec.describe Movie, type: :model do
  describe "relationships" do
    xit {should have_many :actors}
    it {should have_one :studio}
  end
end
