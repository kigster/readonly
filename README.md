# ReadOnly — Wrap Any Class in a Readonly Proxy

This gem is meant as a fail-safe to guard certain data against
modification, and to enforce immutability to a certain extent.  

Of course nothing can be completely immutable in ruby, but by using this
gem, and at the very least, the unintentional mutation of important 
objects can be prevented.

## Usage

The gem works for any class by asking the user to define which of the methods
on the original objects can be safely delegated to the object itself,
and which of the methods (the mutable ones) should not be.

When wrapping a class, one must do three things in the following order:

1. include module `ReadOnly::Proxy`
2. call class method `safe_methods` and pass an array of symbols
   representing safe methods of the class that can be delegated
3. include module `ReadOnly::DelegateSafeMethods`

### Readonly Hash

Gem comes with a built-in example: `ReadOnly::Hash`. It's an example of
how any class (a `Hash` in this case) can be wrapped by this library to
create a immutable version.

Below we demonstrate our attempts to write to this class: note that the
first level key assignment raises `NoMethodError` because `[]=` method
was not declared as a safe method, and is not delegated.

Second level key returns a regular hash, which can be modified of
course, but in this case the returned object is a deep copy of the
original, and while it can be changed, this does not affect the original 
object.

```ruby
require 'readonly/hash'
  
@writable_hash = { user: { name: 'Konstantin', phone: '555-222-5555' } }
@readonly_hash = ReadOnly::Hash.new @writable_hash

@readonly_hash[:user][:name] 
#=> Konstantin
@readonly_hash[:user][:name] = 'John'
#=> John 
@readonly_hash[:user][:name] 
#=> Konstantin

# Top level actually raises NoMethodError
@readonly_hash[:user] = [ 1,2,3 ]
#=> NoMethodError: undefined method `[]=' for {:user=>{:name=>"Konstantin", :phone=>"555-222-5555"}}:ReadOnly::Hash
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'readonly'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install readonly

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kigster/readonly.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

