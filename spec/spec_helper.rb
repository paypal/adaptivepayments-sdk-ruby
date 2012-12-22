require 'bundler/setup'

Bundler.require :default, :test
PayPal::SDK::Core::Config.load('spec/config/paypal.yml', 'test')

require 'paypal-sdk-adaptivepayments'
