require 'spec_helper'

describe FactoryGirl::Jsonapi::RecordFactory do
  let(:factory) { build(:user, id: 1, name: 'John Doe') }

  context '#to_json' do
    let(:expected_factory) do
      {
          data: {
              id: '1',
              type: 'users',
              attributes: {
                  name: 'John Doe'
              }
          }
      }.to_json
    end

    it 'factory should return correct result' do
      expect(factory.to_json).to eq expected_factory
    end
  end

  context '#dup' do
    it 'should create correct duplicate' do
      new = factory.dup
      expect(new.to_json).to eq factory.to_json
    end

    it 'should be different objects' do
      new = factory.dup
      new.id = 999
      expect(new.to_json).to_not eq factory.to_json
      expect(new.id).to_not eq factory.id
    end
  end
end
