require 'factory_girl'

module FactoryGirlJsonApi
  class NilRelationFactory < RecordFactory
    def relation_with_data?
      true
    end

    def to_relation
      nil
    end

    def to_data
      nil
    end
  end
end
