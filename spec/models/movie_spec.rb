require 'rails_helper'

RSpec.describe Movie, type: :model do
  subject { Movie.new title: 'Anything', year: 1950, poster_url: '/somewhere/somepic.jpg' }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a title" do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a year" do
    subject.year = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a year greater than 1900"

  it "is not valid without a poster URL" do
    subject.poster_url = nil
    expect(subject).to_not be_valid
  end
end
