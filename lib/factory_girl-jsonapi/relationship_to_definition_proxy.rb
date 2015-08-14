# coding: utf-8
require 'factory_girl'

module FactoryGirl
  module Jsonapi
    module RelationshipToDefinitionProxy
      def relationship(name, *options)
        options = options.first || {}
        options[:strategy] ||= :build
        options[:factory] ||= name
        @definition.declare_attribute(::FactoryGirl::Declaration::Association.new(name, options))
      end
    end
  end
end

FactoryGirl::DefinitionProxy.public_send(:include, FactoryGirl::Jsonapi::RelationshipToDefinitionProxy)
