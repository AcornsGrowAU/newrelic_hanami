# NewRelic::Lotus

NewRelic instrumentation for [Lotus](https://github.com/lotus/lotus).

## Installation

Add this line to your application's Gemfile:

    gem 'newrelic_lotus'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install newrelic_lotus

Make sure that you've told rack to start the NewRelic agent:

    # config.ru
    require ::File.expand_path('../config/environment', __FILE__)

    # You need to manually start the agent
    NewRelic::Agent.manual_start

    run Lotus::Container.new


## Usage

Ensure that you have working NewRelic instrumentation. Add the `newrelic_lotus` gem. That's it.

## Disabling Instrumentation

Set `disable_lotus` in `newrelic.yml` or `ENV['DISABLE_NEW_RELIC_LOTUS']` to disable instrumentation.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Update `CHANGELOG.md` describing your changes
4. Commit your changes (`git commit -am 'Add some feature'`)
5. Push to the branch (`git push origin my-new-feature`)
6. Create new Pull Request
