# coding: utf-8
require 'factory_girl'

module FactoryGirlJsonApi
  module RelationshipToDefinitionProxy
    def relationship(name, *options)
      options = options.first || {}
      options[:strategy] ||= :build
      options[:factory] ||= name
      @definition.declare_attribute(::FactoryGirl::Declaration::Association.new(name, options))
    end
  end
end

FactoryGirl::DefinitionProxy.public_send(:include, FactoryGirlJsonApi::RelationshipToDefinitionProxy)
