require 'factory_girl'

module FactoryGirl
  module Jsonapi
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
end

FactoryGirl.define do
  factory :jsonapi_nil_relations,
          class: FactoryGirl::Jsonapi::NilRelationsFactory do
  end
end
