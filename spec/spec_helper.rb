$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'rack/test'

RSpec.configure do |config|
  config.include Rack::Test::Methods
end

require 'hanami/controller'
require 'newrelic_rpm'
require 'newrelic_hanami'
