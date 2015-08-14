require 'factory_girl'

module FactoryGirl
  module Jsonapi
    class ErrorsFactory
      attr_reader :errors

      def errors=(value)
        @errors = Array.wrap(value)
      end

      def to_errors
        {
            errors: errors.map(&:to_error_data)
        }
      end

      def to_json
        to_errors.to_json
      end

      alias_method :to_s, :to_json
    end
  end
end

FactoryGirl.define do
  factory :jsonapi_errors, class: FactoryGirl::Jsonapi::ErrorsFactory do
  end
end
