require 'spec_helper'

describe FactoryGirl::Jsonapi::ErrorsFactory do
  let(:errors) do
    [
        build(:validation_error, title: 'should be present', field_name: :name),
        build(:validation_error, title: 'should be blank', field_name: :nickname)
    ]
  end

  let(:errors_collection) do
    build(:jsonapi_errors, errors: errors)
  end

  let(:expected_errors) do
    {
        errors: [
            {
                title: 'should be present',
                detail: 'name - should be present',
                id: nil,
                href: nil,
                code: 100,
                source: {
                    pointer: '/data/attributes/name'
                },
                links: nil,
                status: 'unprocessable_entity'
            },
            {
                title: 'should be blank',
                detail: 'nickname - should be blank',
                id: nil,
                href: nil,
                code: 100,
                source: {
                    pointer: '/data/attributes/nickname'
                },
                links: nil,
                status: 'unprocessable_entity'
            }
        ]
    }.to_json
  end

  it 'factory should return correct result' do
    expect(errors_collection.to_json).to eq expected_errors
  end
end
