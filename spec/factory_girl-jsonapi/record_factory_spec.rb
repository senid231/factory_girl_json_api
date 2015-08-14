require 'spec_helper'

describe FactoryGirl::Jsonapi::RecordFactory do

  FactoryGirl.define do
    factory :user, parent: :jsonapi_record do
      type :users
      id 1
      name 'John Doe'
    end
  end

  let(:expected_factory) do
    f = FactoryGirl::Jsonapi::RecordFactory.new
    f.attributes[:name] = 'John Doe'
    f.id = 1
    f.type = :users
  end

  it 'factory_girl result and should be equal' do
    factory = build(:user)
    expected_factory = FactoryGirl::Jsonapi::RecordFactory.new
    expect(factory).to eq expected_factory
  end

end
