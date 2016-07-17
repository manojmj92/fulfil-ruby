# Used to issue requests to API. All models call this class to issue requests.
require 'fulfil'
require 'fulfil/constants'
require 'fulfil/errors/base_error'
require 'curb'

module Fulfil
  class Request
    def initialize(url)
      check_auth_params
      @options ={
        base_url:  (Fulfil::BASE_URL % {subdomain: Fulfil.authentication[:subdomain]}) << url,
        api_key:  Fulfil.authentication[:api_key]
      }
    end

    def get(id)
      request :get, {}, "/#{id}"
    end

    def all(data)
      request :get, data
    end

    def find(data)
      request :get, data
    end

    # TODO
    #def create(data)
     # request :post, data
    #end

    private

    # USed to check if auth is done properly before making calls
    def check_auth_params
      if (Fulfil.authentication.nil? || Fulfil.authentication[:subdomain].empty? || Fulfil.authentication[:api_key].empty?)
        raise Fulfil::AuthenticationError, "Please set your subdomain and api key"
      end
    end

    # Issue request and get response
    def request(http_method, data={}, url="")
      final_url = @options[:base_url] << url
        begin
          case http_method
              when :get
                response = Curl.get(final_url, data) do |http|
                  http.headers['x-api-key'] = @options[:api_key]
                  http.headers['Accept'] = 'application/json'
                end
          end
        rescue Curl::Err::HostResolutionError
          raise Fulfil::HostResolutionError, "Invalid Subdomain"
        end
      parse_response response
    end

    def parse_response response
        if response.response_code == 401
          raise Fulfil::UnauthorizedError, "Unauthorized access"
        else
          create_response response
        end
    end

    # Recursively builds response as object of Fulfil::Base class.
    def create_response response
      json = JSON.parse(response.body_str)
      if json.is_a?(Array)
        result = json.map {|result| Fulfil::Base.new(result)}
      else
        result = Fulfil::Base.new(json)
        if result.type == "UserError"
          raise Fulfil::UserError, result.message
        end
      end
      result
    end

  end
end
