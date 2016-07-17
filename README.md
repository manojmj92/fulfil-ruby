# Fulfil

Fulfil.io Ruby Gem

## Installation

Add this line to your application's Gemfile:

    gem 'fulfil'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fulfil

## Usage

Please use `require 'fulfil'` before you start using the gem.

To setup your account, you need to do the following

`Fulfil.setup("your_subdomain","api_key")`

If you are using rails, this should ideally go inside an initializer.

## Products API

This will fetch you products in your account

```rb

#To get a product with a specific ID

product = Fulfil::Product.get id

#To get all products in your account

products = Fulfil::Product.all

#To find a specific product using filter

product = Fulfil::Product.find(['name','=','iphone6s'])

puts product.name,product.id

#any attribute is a valid method of the object.

```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/fulfil/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
