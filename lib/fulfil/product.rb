# Product Model
require 'fulfil'
require 'fulfil/constants'
require 'fulfil/request'
require 'fulfil/base'

module Fulfil
  class Product < Base
    class << self
      private
      def request
        Fulfil::Request.new(Fulfil::PRODUCT_PATH)
      end
    end
  end
end
