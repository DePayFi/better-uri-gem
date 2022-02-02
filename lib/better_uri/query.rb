# frozen_string_literal: true

require 'rack/utils'
require 'active_support'
require 'active_support/core_ext/hash/indifferent_access'
require 'active_support/core_ext/hash/conversions'
require 'active_model'
require 'active_model/serialization'
require 'active_model/serializers/json'

module BetterUri
  class Query
    delegate :[], :dig, :to_param, :to_query, :as_json, to: :parsed_query

    def initialize(uri)
      @uri = uri
    end

    def to_s
      @uri.query_string
    end

    def merge(*args, &block)
      @uri.dup.tap do |uri|
        uri.query_string = build_query_string(parsed_query.merge(*args, &block))
      end
    end

    def merge!(*args, &block)
      @uri.tap do |uri|
        uri.query_string = build_query_string(parsed_query.merge(*args, &block))
      end
    end

    def except(*args, &block)
      @uri.dup.tap do |uri|
        uri.query_string = build_query_string(parsed_query.except(*args, &block))
      end
    end

    def except!(*args, &block)
      @uri.tap do |uri|
        uri.query_string = build_query_string(parsed_query.except(*args, &block))
      end
    end

    private

    def parsed_query
      Rack::Utils.parse_nested_query(@uri.query_string).with_indifferent_access
    end

    def build_query_string(query)
      query.to_param if query.present?
    end
  end
end
