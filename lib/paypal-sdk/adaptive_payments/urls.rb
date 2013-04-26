module PayPal
  module SDK
    module AdaptivePayments
      module Urls
        REDIRECT_ENDPOINTS = {
          :live => "https://www.paypal.com/webscr",
          :sandbox => "https://www.sandbox.paypal.com/webscr" }

        def redirect_url(params = {})
          "#{REDIRECT_ENDPOINTS[api_mode]}?#{encode_www_form(params)}"
        end

        def payment_url(key)
          key = key.payKey if key.respond_to?(:payKey)
          redirect_url(:cmd => "_ap-payment", :paykey => key.to_s)
        end
        alias_method :pay_url, :payment_url

        def preapproval_url(key)
          key = key.preapprovalKey if key.respond_to?(:preapprovalKey)
          redirect_url(:cmd => "_ap-preapproval", :preapprovalkey => key.to_s)
        end
      end
    end
  end
end
