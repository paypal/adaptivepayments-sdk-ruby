# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'paypal-sdk/adaptive_payments/version'

Gem::Specification.new do |gem|
  gem.name          = "paypal-sdk-adaptivepayments"
  gem.version       = PayPal::SDK::AdaptivePayments::VERSION
  gem.authors       = ["PayPal"]
  gem.email         = ["DL-PP-Platform-Ruby-SDK@ebay.com"]
  gem.summary       = %q{PayPal Adaptive Payments SDK}
  gem.description   = %q{The PayPal Adaptive Payments SDK provides Ruby APIs to create, process and manage simple and complex (parallel and chained) payments, and pre-approvals using the Adaptive Payments API.}
  gem.homepage      = "https://www.x.com/"

  gem.files         = Dir["{bin,spec,lib}/**/*"] + ["Rakefile", "README.md", "Gemfile"]
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency('paypal-sdk-core', '~> 0.1.2')
end
