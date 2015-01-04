source "https://rubygems.org"

# Default to most recent 3.x release.
gem 'puppet', (ENV['PUPPET_VERSION'] || '~> 3.7'), :require => false

group :test do
  gem 'rake', :require => false
  # NOTE: RSpec and mocha are pinned at the same versions used by Puppet 3.x.
  # Puppet 2.7.x uses RSpec 2.10.x, so a patchlevel may have to be dropped if
  # this causes problems in the future.
  gem 'rspec',        '~> 2.11.0', :require => false
  gem 'mocha',        '~> 0.10.5', :require => false
  gem 'rspec-puppet', '~> 1.0.0', :require => false
end

if File.exists? "#{__FILE__}.local"
    eval(File.read("#{__FILE__}.local"), binding)
end
