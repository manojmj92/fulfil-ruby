require 'spec_helper'

describe Fulfil::Product do

  before(:each) do
    Fulfil.setup("subdomain","api_key")
    @product = Fulfil::Product
  end

   describe '.get' do
    it 'should raise Fulfil::HostResolutionError if subdomain is not proper' do
      Fulfil.setup("incorrect_subdomain","correct_api_key")
      expect{@product.get(13)}.to raise_exception(Fulfil::HostResolutionError)
    end

    it 'should raise Fulfil::UnauthorizedError if api_key is not proper' do
      Fulfil.setup("correct_subdomain","incorrect_api_key")
      expect{@product.get(13)}.to raise_exception(Fulfil::UnauthorizedError)
    end

    it 'should raise ArgumentError if id is not passed' do
      expect{@product.get}.to raise_exception(ArgumentError)
    end

    it 'should return a single object' do
      expect(@product.get(13)).to be_a_kind_of(Fulfil::Base)
    end

    it 'should raise error for item that does not exist' do
      expect{@product.get(10000)}.to raise_exception(Fulfil::UserError)
    end
   end

   describe '.all' do
    it 'should raise Fulfil::HostResolutionError if subdomain is not proper' do
      Fulfil.setup("incorrect_subdomain","correct_api_key")
      expect{@product.all}.to raise_exception(Fulfil::HostResolutionError)
    end

    it 'should raise Fulfil::UnauthorizedError if api_key is not proper' do
      Fulfil.setup("fulfil_demo","incorrect_api_key")
      expect{@product.all}.to raise_exception(Fulfil::UnauthorizedError)
    end

    it 'should return an array of objects with each object of kind Fulfil::Base' do
     instance = @product.all
     expect(instance).to be_a_kind_of(Array)
     expect(instance).to all(be_a_kind_of(Fulfil::Base))
    end

    it 'should return array of proper size as defined by per_page attribute' do
    expect(@product.all(page=1,per_page=3).length).to be(3)
    end
   end

   describe '.find' do
    it 'should raise Fulfil::HostResolutionError if subdomain is not proper' do
      Fulfil.setup("incorrect_subdomain","correct_api_key")
      expect{@product.get(13)}.to raise_exception(Fulfil::HostResolutionError)
    end

    it 'should raise Fulfil::UnauthorizedError if api_key is not proper' do
      Fulfil.setup("fulfil_demo","incorrect_api_key")
      expect{@product.get(13)}.to raise_exception(Fulfil::UnauthorizedError)
    end

    it 'should raise ArgumentError if filter is not provided or if filter is blank' do
      expect{@product.find([])}.to raise_exception(ArgumentError)
    end

    it 'should return empty array if there are no matching results' do
      instance = @product.find(['name','=','manoj'])
      expect(instance).to be_a_kind_of(Array)
      expect(instance.length).to be(0)
    end

    it 'should return array of Fulfil::Base objects if there are matching results' do
      instance = @product.find(['name','=','CONCENTRATE FUSION FIRE END - RED - 750MM'])
      expect(instance).to be_a_kind_of(Array)
      expect(instance).to all(be_a_kind_of(Fulfil::Base))
    end
   end
end
