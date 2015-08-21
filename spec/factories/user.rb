FactoryGirl.define do
  factory :user, parent: :json_api_record do
    type :users

    trait :with_relations do
      relationship :department
    end

    trait :with_included do
      relationship :department, id: 2, name: 'included department'
    end

    factory :user_filled do
      sequence(:id) { |n| n.to_s }
      sequence(:name) { |n| "user #{n}" }
    end
  end
end
