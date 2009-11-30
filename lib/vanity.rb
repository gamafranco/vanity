$LOAD_PATH.unshift File.join(File.dirname(__FILE__), "../vendor/redis-rb/lib")
require "redis"
require "openssl"
require "date"
require "logger"

# All the cool stuff happens in other places.
# @see Vanity::Rails
# @see Vanity::Playground
# @see Vanity::Metric
# @see Vanity::Experiment
module Vanity
  # Version number.
  module Version
    version = Gem::Specification.load(File.expand_path("../vanity.gemspec", File.dirname(__FILE__))).version.to_s.split(".").map { |i| i.to_i }
    MAJOR = version[0]
    MINOR = version[1]
    PATCH = version[2]
    STRING = "#{MAJOR}.#{MINOR}.#{PATCH}"
  end
end

require "vanity/backport" if RUBY_VERSION < "1.9"
require "vanity/metric"
require "vanity/experiment/base"
require "vanity/experiment/ab_test"
require "vanity/playground"
Vanity.autoload :MockRedis, "vanity/mock_redis"
Vanity.autoload :Commands, "vanity/commands"
require "vanity/rails" if defined?(Rails)
