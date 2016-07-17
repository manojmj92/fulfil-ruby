require 'spec_helper'

describe Fulfil::Base do
  before(:each) do
    Fulfil.setup("subdomain","api_key")
    @product = Fulfil::Product.get(13)
  end
  describe "method missing" do
    it "should print attribute value when corresponding method is called on object" do
      expect(@product.name).to be_a_kind_of(String)
    end

    it "should raise NoMethodError if the key does not exist in the result" do
      expect{@product.some_method}.to raise_exception(NoMethodError)
    end
  end
end
