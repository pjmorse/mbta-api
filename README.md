# mbta-api

[![Code Climate](https://codeclimate.com/github/pjmorse/mbta-api/badges/gpa.svg)](https://codeclimate.com/github/pjmorse/mbta-api)

Ruby gem to wrap [the MBTA v2 "realtime" API](http://realtime.mbta.com/portal)

## Plan

* The API object will return Ruby objects (POROs) representing the responses from the MBTA API.
  - Those objects will have public methods to return both the raw JSON they were created from, and a simplified JSON serialization; this latter form can be overloaded to customize JSON delivered to hypothetical clients.
  - The objects will also support additional related queries back to the API (e.g. a query for nearby stations will return Station objects, which could in turn be queried for lines and/or next trains.)
* As a commuter rail commuter, I'll start with commuter rail, then subways, then buses
* The data structure of the wrapper will map as closely to the data returned by the API as practical.
* When the data returned from the API maps to native Ruby data structures, it will be parsed as such (e.g. when the API returns timestamps, the wrapper will parse to Ruby DateTime objects).

## TODO

* [x] API object: initialization, connections, API key setup
* [x] Stub API method calls
* [ ] Build out stubs
* [ ] Map objects needed
* [ ] Iterate over objects to map attributes and methods needed

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mbta-api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mbta-api

## What's the point?

It will help me learn the T's API in better detail. Making the API easier to work with should motivate additional developer work in making this data useful for more commuters. And while I can't make my train be on time more often (unfortunately), I can make its data more widely usable.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

You will almost certainly benefit from checking out [the API Documentation](http://realtime.mbta.com/Portal/Home/Documents). 

### See Also

In planning this gem, I found (at least) three other similar attempts to provide a wrappers for the MBTA data API, all of which included interesting ideas which are in some way incorporated in mbta-api.

* [mbta-realtime](https://github.com/beechnut/mbta-realtime)
* [mbta](https://github.com/farski/mbta)
* [mbta_wrapper](https://github.com/ryancw/mbta_wrapper)

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/pjmorse/mbta-api.

