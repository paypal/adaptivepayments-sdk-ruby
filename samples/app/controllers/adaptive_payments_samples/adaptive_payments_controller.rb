require_dependency "adaptive_payments_samples/application_controller"

module AdaptivePaymentsSamples
  class AdaptivePaymentsController < ApplicationController
    include PayPal::SDK::AdaptivePayments

    SERVICE_ACTIONS = Services.instance_methods.select{|s| s =~ /^[A-Z]/ and s !~ /^Build/ }
    build_services(SERVICE_ACTIONS, "", "_response", "Request")

    def index
      redirect_to :action => :pay
    end

    private

    def api
      @api ||= API.new
    end
  end
end
