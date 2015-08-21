FactoryGirl.define do
  factory :validation_error, parent: :json_api_error do
    title 'is invalid'
    code FactoryGirlJsonApi::ErrorFactory::VALIDATION_ERROR
    status FactoryGirlJsonApi::ErrorFactory::STATUSES[
               FactoryGirlJsonApi::ErrorFactory::VALIDATION_ERROR
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
