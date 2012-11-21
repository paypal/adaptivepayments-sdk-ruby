$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "adaptive_payments_samples/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "adaptive_payments_samples"
  s.version     = AdaptivePaymentsSamples::VERSION
  s.authors     = ["siddick"]
  s.email       = ["mebramsha@paypal.com"]
  s.homepage    = "https://www.x.com/"
  s.summary     = "Samples for AdaptivePayments."
  s.description = "Samples for AdaptivePayments."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.9"
  s.add_dependency "paypal-sdk-adaptivepayments"
  s.add_dependency "twitter-bootstrap-rails"
  s.add_dependency "therubyracer"
  s.add_dependency "less-rails"
  s.add_dependency "simple_form"
  s.add_dependency "haml"
  s.add_dependency "coderay"
  s.add_dependency "jquery-rails"
end
