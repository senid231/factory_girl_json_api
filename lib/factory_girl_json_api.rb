require 'factory_girl_json_api/relationship_to_definition_proxy'
require 'factory_girl_json_api/record_factory'
require 'factory_girl_json_api/collection_factory'
require 'factory_girl_json_api/error_factory'
require 'factory_girl_json_api/errors_factory'
require 'factory_girl_json_api/nil_relation_factory'
require 'factory_girl_json_api/nil_relations_factory'
require 'factory_girl'

module FactoryGirlJsonApi
  module FactoryGirlExtension
    extend ActiveSupport::Concern

    included do

      FactoryGirl::DefinitionProxy.public_send(:include, ::FactoryGirlJsonApi::RelationshipToDefinitionProxy)

      FactoryGirl.define do
        factory :json_api_record, class: ::FactoryGirlJsonApi::RecordFactory do
        end
        factory :json_api_collection, class: ::FactoryGirlJsonApi::CollectionFactory do
        end
        factory :json_api_error, class: ::FactoryGirlJsonApi::ErrorFactory do
        end
        factory :json_api_errors, class: ::FactoryGirlJsonApi::ErrorsFactory do
        end
        factory :json_api_nil_relation, class: ::FactoryGirlJsonApi::NilRelationFactory do
        end
        factory :json_api_nil_relations, class: ::FactoryGirlJsonApi::NilRelationsFactory do
        end
      end

    end
  end
end
