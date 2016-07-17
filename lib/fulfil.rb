# Basic authentication
require "fulfil/version"
require "fulfil/product"

module Fulfil
  class << self
    attr_accessor :authentication, :base_url
    def setup(subdomain,api_key)
      self.authentication = { subdomain: subdomain, api_key: api_key }
    end
  end
end
