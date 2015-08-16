FactoryGirl.define do
  factory :validation_error, parent: :jsonapi_error do
    title 'is invalid'
    code FactoryGirl::Jsonapi::ErrorFactory::VALIDATION_ERROR
    status FactoryGirl::Jsonapi::ErrorFactory::STATUSES[
               FactoryGirl::Jsonapi::ErrorFactory::VALIDATION_ERROR
           ]

    transient do
      field_name nil
    end

    after(:build) do |error, evaluator|
      error.detail = "#{evaluator.field_name} - #{error.title}"
      error.source_pointer = evaluator.field_name.try!(:to_sym)
    end
  end
end
