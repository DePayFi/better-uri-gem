require 'active_support/core_ext/module/delegation'

module BetterUri
  URI_CORE = URI

  class URI < SimpleDelegator

    attr_reader :uri

    def initialize(string)
      @uri = super(URI_CORE.parse(string.to_s))
    end

    def empty?
      @uri.to_s.empty?
    end

    def dup
      self.class.new(@uri.to_s)
    end

    def query_string
      @uri.query
    end

    def query_string=(val)
      @uri.query = val
    end
    alias query= query_string=

    def query
      BetterUri::Query.new(self)
    end
    alias params query
  end
end
