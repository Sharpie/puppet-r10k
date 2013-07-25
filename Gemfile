source "https://rubygems.org"

gem 'puppet', '>= 2.7.0', :require => false

group :test do
  gem 'rake'
  # NOTE: RSpec and mocha are pinned at the same versions used by Puppet 3.x.
  # Puppet 2.7.x uses RSpec 2.10.x, so a patchlevel may have to be dropped if
  # this causes problems in the future.
  gem 'rspec',        '~> 2.11.0', :require => false
  gem 'mocha',        '~> 0.10.5', :require => false
  gem 'rspec-puppet', :git => 'https://github.com/rodjek/rspec-puppet',  :require => false
end

if File.exists? "#{__FILE__}.local"
    eval(File.read("#{__FILE__}.local"), binding)
end
