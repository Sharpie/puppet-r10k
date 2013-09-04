source "https://rubygems.org"

if ENV.key?('PUPPET_VERSION')
    puppetversion = "= #{ENV['PUPPET_VERSION']}"
else
    puppetversion = ['~> 2.7']
end

gem 'puppet', puppetversion

group :test do
  gem 'rake'
  gem 'puppet-lint'
  gem 'puppet-syntax'
  gem 'rspec-puppet'
  gem 'puppetlabs_spec_helper'
end

if File.exists? "#{__FILE__}.local"
    eval(File.read("#{__FILE__}.local"), binding)
end
