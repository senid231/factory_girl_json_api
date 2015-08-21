require 'spec_helper'

describe FactoryGirlJsonApi::RecordFactory do
  let(:factory) { build(:user, :with_relations, id: 1, name: 'John Doe') }

  context '#to_json' do
    let(:expected_factory) do
      {
          data: {
              id: '1',
              type: 'users',
              attributes: {
                  name: 'John Doe'
              },
              relationships: {
                  department: {}
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

  context 'with included' do
    let(:factory) { build(:user, :with_included, id: 1, name: 'John Doe') }
    let(:expected_factory) do
      {
          data: {
              id: '1',
              type: 'users',
              attributes: {
                  name: 'John Doe'
              },
              relationships: {
                  department: {
                      data: {
                          id: '2',
                          type: 'departments'
                      }
                  }
              }
          },
          included: [
              {
                  id: '2',
                  type: 'departments',
                  attributes: {
                      name: 'included department'
                  }
              }
          ]
      }.to_json
    end

    it 'factory should return correct result' do
      expect(factory.to_json).to eq expected_factory
    end
  end
end
