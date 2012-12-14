# Setup AdaptivePayments Samples

Add following line in rails `Gemfile`:

    gem 'paypal-sdk-adaptivepayments'
    gem 'adaptive_payments_samples', :git => "https://github.com/paypal/adaptivepayments-sdk-ruby.git", :group => :development

Configure routes(`config/routes.rb`):

    mount AdaptivePaymentsSamples::Engine => "/samples" if Rails.env.development?

To get default paypal configuration execute:

    rails g paypal:sdk:install

Run `rails server` and check the samples.
