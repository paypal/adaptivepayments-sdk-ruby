source 'https://rubygems.org'

gemspec

gem 'paypal-sdk-core', :git => "https://github.com/paypal/sdk-core-ruby.git", :branch => "fix-ruby1.8"

if File.exist? File.expand_path('../samples/adaptive_payments_samples.gemspec', __FILE__)
  gem 'adaptive_payments_samples', :path => 'samples', :require => false
  group :test do
    gem 'rspec-rails', :require => false
    gem 'capybara', :require => false
  end
end

group :test do
  gem 'rspec'
end
