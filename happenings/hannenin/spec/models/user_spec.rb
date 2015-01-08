require 'rails_helper'

RSpec.describe User, :type => :model do
  it "orders by last name" do
    lindeman = User.create!(email: "Lindeman@test.com", password: "password")
    chelimsky = User.create!(email: "Chelimsky@test.com", password: "password")

    # expect(User.ordered_by_last_name).to eq([chelimsky, lindeman])
  end
end
