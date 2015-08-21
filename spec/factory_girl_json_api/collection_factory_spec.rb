require 'spec_helper'

describe FactoryGirlJsonApi::CollectionFactory do
  let(:factories) do
    [
        build(:user, id: 1, name: 'Foo'),
        build(:user, id: 2, name: 'Bar')
    ]
  end
  let(:collection) { build(:json_api_collection, records: factories) }

  let(:expected_collection) do
    {
        data: [
            {
                id: '1',
                type: 'users',
                attributes: {
                    name: 'Foo'
                }
            },
            {
                id: '2',
                type: 'users',
                attributes: {
                    name: 'Bar'
                }
            }
        ]
    }.to_json
  end

  it 'factory should return correct result' do
    expect(collection.to_json).to eq expected_collection
  end
end
