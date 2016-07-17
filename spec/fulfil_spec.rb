require 'spec_helper'

describe Fulfil do
  describe '.setup' do
    it 'should setup authentication' do
      expect(Fulfil.setup(subdomain = "subdomain", api_key = "api_key")).to be_a_kind_of(Hash)
    end
  end

  describe "setup variables" do
    it 'should be a string' do
      instance = Fulfil.setup(subdomain = "subdomain", api_key = "api_key")
      expect(instance[:api_key]).to be_a_kind_of(String)
      expect(instance[:subdomain]).to be_a_kind_of(String)
    end
  end
end
