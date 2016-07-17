require 'spec_helper'

describe Fulfil::Request do

  before(:each) do
    Fulfil.setup("subdomain","api_key")
    @request = Fulfil::Request.new(Fulfil::PRODUCT_PATH)
  end

  describe 'initialize' do
    it "should return error if authentication is not set" do
      Fulfil.authentication = nil
      expect{Fulfil::Request.new("product.product")}.to raise_exception(Fulfil::AuthenticationError)
    end
  end

end
