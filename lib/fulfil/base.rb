# This is the base class for all models. Each object in response is an object of this class.

require 'fulfil'
require 'json'
module Fulfil
  class Base

    def initialize(args)
      @args = args
    end

    class << self
    # Method to get single object using ID
      def get(id)
        raise ArgumentError, 'Please provide an ID' if id.to_s.empty?
        request.get id
      end

      # Method to get all objects in a model
      def all(page=1,per_page=10)
        request.all({:page => page, :per_page => per_page})
      end

      # Method to find specific object in a model using filters
      def find(filter=[],page=1,per_page=10)
        raise ArgumentError, 'Please provide a filter' if filter.empty?
        request.find({:filter => filter, :page => page, :per_page => per_page})
      end

      # TODO
      #def create(data)
        #request.create(data)
      #eend

    end

    # This will return arguments as object methods.
    def method_missing(method)
      method = method.to_s
      raise NoMethodError, "No such method: #{method}" unless @args.keys.include? method
      @args[method]
    end
  end
end
