require 'paypal-sdk-core'

module PayPal
  module SDK
    module AdaptivePayments
      class API < Core::API::Platform
        include Services

        def initialize(environment = nil, options = {})
          super(SERVICE_NAME, environment, options)
        end

        ADAPTIVE_PAYMENTS_HTTP_HEADER = { "X-PAYPAL-REQUEST-SOURCE" => "adaptivepayments-ruby-sdk-#{VERSION}" }
        def default_http_header
          super.merge(ADAPTIVE_PAYMENTS_HTTP_HEADER)
        end
      end
    end
  end
end

