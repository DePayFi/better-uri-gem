## Quick start guide

```ruby
  gem install better_uri
```

or add it to your Gemfile:

```ruby
  gem 'better_uri'
```

Replace ruby core URI with `BetterUri::URI`.

In plain ruby:
```ruby
define_method(:URI, ->(string) { BetterUri::URI.new(string) })
```

In rails:
```ruby
# config/initalizers/uri.rb

define_method(:URI, ->(string) { BetterUri::URI.new(string) })
```

If you already have code in place that uses ruby core `URI` you can skip the replacement and just use `BetterUri::URI` directly:

```ruby
BetterUri::URI.new('https://depay.fi')
```

## Working with URIs

`BetterUri::URI` has the following capabilities:

### Queries

#### Merge hashes into url queries

`merge(hash)` - returns a copy of the base BetterUri::URI with given hash being merged into the query params:

```ruby

uri = URI('https://depay.fi/d/abc')
uri.to_s # https://depay.fi/d/abc

uri.query.merge(tracking_id: 123).to_s # https://depay.fi/d/abc?tracking_id=123
```

If you place those urls directly in the view or api response, an explicit to_s is not necessary:

```ruby

%a{href: URI('https://depay.fi/d/abc').query.merge(tracking_id: 123)} # <a href="https://depay.fi/d/abc?tracking_id=123"/>

```

`merge!(hash)` - the same as `merge` but changes the original URI.

`merge(hash)` and `merge!(hash)` also support nested query:

```ruby

uri = URI('https://depay.fi/entries/abc/bookings/new')
uri.query.merge(booking: { people: 2 }).to_s # https://depay.fi/entries/abc/bookings/new?booking[people]=2
```

#### Access data in queries

```ruby

uri = URI('https://depay.fi?id=1&place[name]=casa')
uri.query[:id] # '1'
uri.query.dig(:place, :name) # 'casa'
```

#### Remove parts of a query

```ruby
uri = URI('https://depay.fi?one=1&two=2&three=3')
uri.query.except(:two, :three).to_s # https://depay.fi?one=1
```

`except(keys)` - Returns a uri which query includes everything except given keys.

`except!(keys)` - Removes the given keys from the query of the original uri and returns the uri itself.


#### Convert queries to_param & to_query

```ruby
uri = URI('https://depay.fi?one=1&two=2&three=3')
uri.query.to_param # one=1&three=3&two=2
uri.query.to_query # one=1&three=3&two=2
```

#### Queries as_json

```ruby
uri = URI('https://depay.fi?one=1&two=2&three=3')
uri.query.as_json # {"one"=>"1", "three"=>"3", "two"=>"2"}
```


