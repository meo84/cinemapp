require 'rails_helper'

RSpec.describe Director, type: :model do
  subject { Director.new first_name: 'John', last_name: 'Doe', country: 'AU' }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a first name" do
    subject.first_name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a last name" do
    subject.last_name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a country" do
    subject.country = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a 2-uppercase-letters country" do
    subject.country = "some c0untry"
    expect(subject).to_not be_valid
  end
end

