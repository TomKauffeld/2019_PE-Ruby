$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'codex'

require 'rspec'
require 'rspec/collection_matchers'
require 'rspec/its'

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
