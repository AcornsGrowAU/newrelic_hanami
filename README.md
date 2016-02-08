[![Build Status](https://travis-ci.com/Acornsgrow/newrelic_hanami.svg?token=j8fT5VPY65oQ5xziayzW&branch=master)](https://travis-ci.com/Acornsgrow/newrelic_hanami)

# NewRelic::Hanami

NewRelic instrumentation for [Hanami](https://github.com/hanami/hanami).

## Installation

Add this line to your application's Gemfile:

    gem 'newrelic_hanami'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install newrelic_hanami

Make sure that you've told rack to start the NewRelic agent:

    # config.ru
    require ::File.expand_path('../config/environment', __FILE__)
    require 'newrelic_rpm'
    require 'newrelic_hanami'

    # You need to manually start the agent
    NewRelic::Agent.manual_start

    run Hanami::Container.new


## Usage

Ensure that you have working NewRelic instrumentation. Add the `newrelic_hanami` gem. That's it.

## Disabling Instrumentation

Set `disable_hanami` in `newrelic.yml` or `ENV['DISABLE_NEW_RELIC_HANAMI']` to disable instrumentation.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Update `CHANGELOG.md` describing your changes
4. Commit your changes (`git commit -am 'Add some feature'`)
5. Push to the branch (`git push origin my-new-feature`)
6. Create new Pull Request
