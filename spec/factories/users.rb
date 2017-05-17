FactoryGirl.define do
  factory :user do
    name "simple_user"

      trait :admin do
        admin true
      end
  end
end
