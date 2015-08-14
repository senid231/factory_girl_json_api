require 'factory_girl'

module FactoryGirl
  module Jsonapi
    class CollectionFactory
      attr_accessor :meta, :links
      attr_reader :records

      def records=(value)
        @records = Array.wrap(value)
      end

      def to_records
        _parse_records.reject { |_, v| v.nil? }
      end

      def to_json
        to_records.to_json
      end

      alias_method :to_s, :to_json

      def inspect
        "#<#{self.class}>: @records=#{records.map(&:inspect)}"
      end

      private

      def _parse_included
        [].tap do |result|
          records.each do |record|
            result.concat record.to_includes
          end
          result.uniq! { |include| "#{include[:type]}#{include[:id]}" }
        end
      end

      def _parse_records
        {}.tap do |result|
          result[:links] = links
          result[:data] = records.map(&:to_data)
          result[:included] = _parse_included.presence
          result[:meta] = meta
        end
      end
    end
  end
end

FactoryGirl.define do
  factory :jsonapi_collection, class: FactoryGirl::Jsonapi::CollectionFactory do
  end
end
