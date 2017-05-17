require 'rails_helper'

RSpec.describe User, type: :model do

  describe "Validations" do

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:password) }
    it { should validate_length_of(:name).is_at_most(20) }
    it { should validate_length_of(:password).is_at_least(8) }

    subject { FactoryGirl.build(:user) }
    it { should validate_uniqueness_of(:name) }

  end
end
