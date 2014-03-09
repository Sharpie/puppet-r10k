require 'rspec'
require 'mocha'
require 'puppet'
require 'rspec-puppet'

PROJECT_ROOT = File.expand_path('..', File.dirname(__FILE__))
FIXTURE_PATH = File.expand_path(File.join('spec', 'fixtures'), PROJECT_ROOT)

$LOAD_PATH.unshift File.join(PROJECT_ROOT, 'lib')

RSpec.configure do |config|
  config.mock_with :mocha

  config.module_path = File.join(FIXTURE_PATH, 'modules')
  config.manifest_dir = File.join(FIXTURE_PATH, 'manifests')
end
