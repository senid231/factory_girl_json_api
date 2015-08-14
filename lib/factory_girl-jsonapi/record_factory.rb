require 'factory_girl'
require 'active_support/all'

module FactoryGirl
  module Jsonapi
    class RecordFactory
      attr_reader :id, :type
      attr_accessor :attributes, :relationships, :meta, :links, :relations_links

      def initialize
        @attributes = ActiveSupport::HashWithIndifferentAccess.new
        @relationships = ActiveSupport::HashWithIndifferentAccess.new
        @relations_links = ActiveSupport::HashWithIndifferentAccess.new
        @links = ActiveSupport::HashWithIndifferentAccess.new
      end

      def merge!(attrs = {})
        attributes.merge!(attrs)
        self
      end

      def merge(attrs = {})
        dup.tap do |duplicate|
          duplicate.merge!(attrs)
        end
      end

      def set_links_for_to_many_relation(name, links)
        relations_links[name] = links
      end

      def id=(value)
        @id = value.to_s
      end

      def type=(value)
        @type = value.to_s
      end

      def to_json
        to_record.to_json
      end

      alias_method :to_s, :to_json

      def relation_with_data?
        id.present?
      end

      def to_relation
        { id: id, type: type }
      end

      def to_data
        _parse_data.reject { |_, v| v.nil? }
      end

      def to_includes
        _parse_includes
      end

      def to_record
        {}.tap do |result|
          result[:data] = to_data
          includes = _parse_includes
          result[:included] = includes if includes.present?
          result[:meta] = meta if meta
        end
      end

      def method_missing(method, *args, &block)
        value = args.first

        if method.to_s == 'meta='
          self.meta = value
        elsif method.to_s =~ /^(.*)=$/
          if (value.try!(:first) || value).is_a?(RecordFactory)
            relationships[method] = value
          else
            attributes[$1] = args.first
          end
        elsif attributes.key?(method) && args.blank?
          attributes[method]
        else
          super
        end
      end

      def inspect
        "#<#{self.class}>: @id=#{id} @type=#{type} @attributes=#{attributes}"
      end

      private

      def _parse_relationships
        {}.tap do |result|
          relationships.each do |name, relation|
            result[name] = {}.tap do |rel|
              links = relation.is_a?(Array) ? relations_links[name] : relation.links
              data = relation.is_a?(Array) ? relation.map(&:to_relation).compact : relation.to_relation
              rel[:links] = links if links.present?
              rel[:data] = data if relation.relation_with_data?
            end
          end
        end
      end

      def _parse_includes
        [].tap do |result|
          relationships.each do |_, relation|
            Array.wrap(relation).each do |rel|
              result << rel.to_data if rel.relation_with_data?
            end
          end
        end.compact
      end

      def _parse_data
        {}.tap do |result|
          result[:id] = id.presence
          result[:type] = type
          result[:links] = links.presence
          result[:attributes] = attributes
          result[:relationships] = _parse_relationships.presence
        end
      end

    end
  end
end

FactoryGirl.define do
  factory :jsonapi_record, class: FactoryGirl::Jsonapi::RecordFactory do
  end
end
