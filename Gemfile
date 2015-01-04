source "https://rubygems.org"

# Default to most recent 3.x release.
gem 'puppet', (ENV['PUPPET_VERSION'] || '~> 3.7'), :require => false

group :test do
  gem 'rspec',        '~> 2.14.0'
  gem 'rspec-puppet', '~> 1.0'
  gem 'puppetlabs_spec_helper', '~> 0.8.0'
end

if File.exists? "#{__FILE__}.local"
    eval(File.read("#{__FILE__}.local"), binding)
end
