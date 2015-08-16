require 'spec_helper'

describe FactoryGirl::Jsonapi::ErrorFactory do
  let(:error) do
    build(:validation_error, title: 'should be present', field_name: :name)
  end

  let(:expected_error) do
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
            }
        ]
    }.to_json
  end

  it 'factory should return correct result' do
    expect(error.to_json).to eq expected_error
  end
end
