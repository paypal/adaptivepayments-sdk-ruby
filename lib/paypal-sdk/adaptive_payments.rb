require 'paypal-sdk-core'

module PayPal
  module SDK
    module AdaptivePayments
      autoload :VERSION,   "paypal-sdk/adaptive_payments/version"
      autoload :Services,  "paypal-sdk/adaptive_payments/services"
      autoload :DataTypes, "paypal-sdk/adaptive_payments/data_types"
      autoload :Urls,      "paypal-sdk/adaptive_payments/urls"
      autoload :API,       "paypal-sdk/adaptive_payments/api"

      def self.new(*args)
        API.new(*args)
      end
    end
  end
end
