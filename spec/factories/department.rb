FactoryGirl.define do
  factory :department, parent: :json_api_record do
    type :departments

    factory :department_filled do
      sequence(:id) { |n| n.to_s }
      sequence(:name) { |n| "department ##{n}" }
    end
  end
end
