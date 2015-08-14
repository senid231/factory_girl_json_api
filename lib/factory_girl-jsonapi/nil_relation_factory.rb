require 'factory_girl'

module FactoryGirl
  module Jsonapi
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
end

FactoryGirl.define do
  factory :jsonapi_nil_relation,
          class: FactoryGirl::Jsonapi::NilRelationFactory do
  end
end
