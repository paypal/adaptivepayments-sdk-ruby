require_dependency "adaptive_payments_samples/application_controller"

module AdaptivePaymentsSamples
  class AdaptivePaymentsController < ApplicationController
    include PayPal::SDK::AdaptivePayments

    def index
      redirect_to :action => :pay
    end

    def ipn_notify
      if PayPal::SDK::Core::API::IPN.valid?(request.raw_post)
        logger.info("IPN message: VERIFIED")
        render :text => "VERIFIED"
      else
        logger.info("IPN message: INVALID")
        render :text => "INVALID"
      end
    end

    def cancel_preapproval
      @cancel_preapproval = api.build_cancel_preapproval(params[:CancelPreapprovalRequest] || default_api_value)
      @cancel_preapproval_response = api.cancel_preapproval(@cancel_preapproval) if request.post?
    end

    def confirm_preapproval
      @confirm_preapproval = api.build_confirm_preapproval(params[:ConfirmPreapprovalRequest] || default_api_value)
      @confirm_preapproval_response = api.confirm_preapproval(@confirm_preapproval) if request.post?
    end

    def convert_currency
      @convert_currency = api.build_convert_currency(params[:ConvertCurrencyRequest] || default_api_value)
      @convert_currency_response = api.convert_currency(@convert_currency) if request.post?
    end

    def execute_payment
      @execute_payment = api.build_execute_payment(params[:ExecutePaymentRequest] || default_api_value)
      @execute_payment_response = api.execute_payment(@execute_payment) if request.post?
    end

    def get_allowed_funding_sources
      @get_allowed_funding_sources = api.build_get_allowed_funding_sources(params[:GetAllowedFundingSourcesRequest] || default_api_value)
      @get_allowed_funding_sources_response = api.get_allowed_funding_sources(@get_allowed_funding_sources) if request.post?
    end

    def get_payment_options
      @get_payment_options = api.build_get_payment_options(params[:GetPaymentOptionsRequest] || default_api_value)
      @get_payment_options_response = api.get_payment_options(@get_payment_options) if request.post?
    end

    def payment_details
      @payment_details = api.build_payment_details(params[:PaymentDetailsRequest] || default_api_value)
      @payment_details_response = api.payment_details(@payment_details) if request.post?
    end

    def pay
      @pay = api.build_pay(params[:PayRequest] || default_api_value)
      @pay.ipnNotificationUrl ||= ipn_notify_url
      @pay.returnUrl ||= adaptive_payments_url(:pay)
      @pay.cancelUrl ||= adaptive_payments_url(:pay)
      @pay_response = api.pay(@pay) if request.post?
    end

    def preapproval_details
      @preapproval_details = api.build_preapproval_details(params[:PreapprovalDetailsRequest] || default_api_value)
      @preapproval_details_response = api.preapproval_details(@preapproval_details) if request.post?
    end

    def preapproval
      @preapproval = api.build_preapproval(params[:PreapprovalRequest] || default_api_value)
      @preapproval.ipnNotificationUrl ||= ipn_notify_url
      @preapproval.returnUrl ||= adaptive_payments_url(:preapproval)
      @preapproval.cancelUrl ||= adaptive_payments_url(:preapproval)
      @preapproval_response = api.preapproval(@preapproval) if request.post?
    end

    def refund
      @refund = api.build_refund(params[:RefundRequest] || default_api_value)
      @refund_response = api.refund(@refund) if request.post?
    end

    def set_payment_options
      @set_payment_options = api.build_set_payment_options(params[:SetPaymentOptionsRequest] || default_api_value)
      @set_payment_options_response = api.set_payment_options(@set_payment_options) if request.post?
    end

    def get_funding_plans
      @get_funding_plans = api.build_get_funding_plans(params[:GetFundingPlansRequest] || default_api_value)
      @get_funding_plans_response = api.get_funding_plans(@get_funding_plans) if request.post?
    end

    def get_available_shipping_addresses
      @get_available_shipping_addresses = api.build_get_available_shipping_addresses(params[:GetAvailableShippingAddressesRequest] || default_api_value)
      @get_available_shipping_addresses_response = api.get_available_shipping_addresses(@get_available_shipping_addresses) if request.post?
    end

    def get_shipping_addresses
      @get_shipping_addresses = api.build_get_shipping_addresses(params[:GetShippingAddressesRequest] || default_api_value)
      @get_shipping_addresses_response = api.get_shipping_addresses(@get_shipping_addresses) if request.post?
    end

    def get_user_limits
      @get_user_limits = api.build_get_user_limits(params[:GetUserLimitsRequest] || default_api_value)
      @get_user_limits_response = api.get_user_limits(@get_user_limits) if request.post?
    end

    private

    def api
      @api ||= API.new
    end
  end
end

