source 'https://rubygems.org'

gemspec

gem 'paypal-sdk-core', :git => "https://github.com/paypal/sdk-core-ruby.git"

if Dir.exist? File.expand_path('../samples', __FILE__)
  gem 'adaptive_payments_samples', :path => 'samples', :require => false
  group :test do
    gem 'rspec-rails', :require => false
    gem 'capybara', :require => false
  end
end

group :test do
  gem 'rspec'
end
