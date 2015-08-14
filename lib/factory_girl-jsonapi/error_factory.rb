require 'factory_girl'

module FactoryGirl
  module Jsonapi
    class ErrorFactory
      attr_accessor :title, :detail, :id, :href, :code, :links, :status
      attr_reader :source_pointer

      VALIDATION_ERROR = 100
      INVALID_RESOURCE = 101
      FILTER_NOT_ALLOWED = 102
      INVALID_FIELD_VALUE = 103
      INVALID_FIELD = 104
      PARAM_NOT_ALLOWED = 105
      INVALID_INCLUDE = 112
      INVALID_SORT_CRITERIA = 114
      SAVE_FAILED = 121
      FORBIDDEN = 403
      RECORD_NOT_FOUND = 404
      INTERNAL_SERVER_ERROR = 500
      LOCKED = 423

      STATUSES = {
          VALIDATION_ERROR => 'unprocessable_entity',
          INVALID_RESOURCE => 'bad_request',
          FILTER_NOT_ALLOWED => 'bad_request',
          INVALID_FIELD => 'bad_request',
          PARAM_NOT_ALLOWED => 'bad_request',
          INVALID_INCLUDE => 'bad_request',
          INVALID_SORT_CRITERIA => 'bad_request',
          SAVE_FAILED => 'unprocessable_entity',
          LOCKED => 'locked',
          FORBIDDEN => 'forbidden',
          RECORD_NOT_FOUND => 'not_found',
          INTERNAL_SERVER_ERROR => 500 # 'internal_server_error'
      }.freeze

      def source_pointer=(value)
        if value.is_a?(Symbol)
          @source_pointer = "/data/attributes/#{value}"
        else
          @source_pointer = value
        end
      end

      def to_errors
        {
            errors: [to_error_data]
        }
      end

      def to_json
        to_errors.to_json
      end

      alias_method :to_s, :to_json

      def to_error_data
        {
            title: title,
            detail: detail,
            id: id,
            href: href,
            code: code,
            source: { pointer: source_pointer },
            links: links,
            status: status || STATUSES[code]
        }
      end
    end
  end
end

FactoryGirl.define do
  factory :jsonapi_error, class: FactoryGirl::Jsonapi::ErrorFactory do
  end
end
