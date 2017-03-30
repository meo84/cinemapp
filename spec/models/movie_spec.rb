require 'rails_helper'

RSpec.describe Movie, type: :model do
  subject { Movie.new }

  it "is valid with valid attributes" do
    subject.title = 'Anything'
    expect(subject).to be_valid
  end
  it "is not valid without a title" do
    expect(subject).to_not be_valid
  end
  it "is not valid without a year greater than 1900"
  it "is not valid without a poster URL"
  it "is not valid with at least one director"
end
