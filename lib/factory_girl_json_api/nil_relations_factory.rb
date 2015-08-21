require 'factory_girl'

module FactoryGirlJsonApi
  class NilRelationsFactory < RecordFactory
    def relation_with_data?
      true
    end

    def to_relation
      []
    end

    def to_data
      nil
    end
  end
end
