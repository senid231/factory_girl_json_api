FactoryGirl.define do
  factory :user, parent: :jsonapi_record do
    type :users

    factory :user_filled do
      sequence(:id) { |n| n.to_s }
      sequence(:name) { |n| "user #{n}" }
    end
  end
end
