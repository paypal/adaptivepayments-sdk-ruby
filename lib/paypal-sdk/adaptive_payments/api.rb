require 'paypal-sdk-core'

module PayPal
  module SDK
    module AdaptivePayments
      class API < Core::API::Platform
        include Services
        include Urls

        def initialize(environment = nil, options = {})
          super(SERVICE_NAME, environment, options)
        end

        ADAPTIVE_PAYMENTS_HTTP_HEADER = { "X-PAYPAL-REQUEST-SOURCE" => "adaptivepayments-ruby-sdk-#{VERSION}" }
        def default_http_header
          super.merge(ADAPTIVE_PAYMENTS_HTTP_HEADER)
        end

        # Validate IPN message
        def ipn_valid?(raw_post_data)
          Core::API::IPN.valid?(raw_post_data, config)
        end
      end
    end
  end
end

