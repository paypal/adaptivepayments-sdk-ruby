require 'spec_helper'

describe "AdaptivePayments" do

  before :all do
    @api = PayPal::SDK::AdaptivePayments::API.new
    @api_with_cert = PayPal::SDK::AdaptivePayments::API.new(:with_certificate)
  end

  describe "Examples" do
    it "Pay" do
      # Build request object
      @pay = @api.build_pay({
        :actionType => "PAY",
        :cancelUrl => "http://localhost:3000/samples/adaptive_payments/pay",
        :currencyCode => "USD",
        :feesPayer => "SENDER",
        :ipnNotificationUrl => "http://localhost:3000/samples/adaptive_payments/ipn_notify",
        :receiverList => {
          :receiver => [{
            :amount => 1.0,
            :email => "platfo_1255612361_per@gmail.com" }] },
        :returnUrl => "http://localhost:3000/samples/adaptive_payments/pay" })

      # Make API call & get response
      @pay_response = @api.pay(@pay)
      @pay_response.should be_success

      @payment_details_request = @api.build_payment_details()
      @payment_details_request.payKey = @pay_response.payKey
      @payment_details_response = @api.payment_details(@payment_details_request)
      @payment_details_response.should be_success

      # Make API call & get response
      @pay_response = @api_with_cert.pay(@pay)
      @pay_response.should be_success

      @payment_details_request = @api_with_cert.build_payment_details()
      @payment_details_request.payKey = @pay_response.payKey
      @payment_details_response = @api_with_cert.payment_details(@payment_details_request)
      @payment_details_response.should be_success
    end

    it "Get Payment details" do
      @payment_details_response = @api.payment_details({
        :payKey => "AP-5S482348KH512131U" })
      @payment_details_response.should     be_success
      @payment_details_response.should_not be_failure
      @payment_details_response.should_not be_warning

      @payment_details_response = @api.payment_details({})
      @payment_details_response.should     be_failure
      @payment_details_response.should_not be_success
      @payment_details_response.should_not be_warning
    end

    it "Preapproval" do

      @preapproval = @api.build_preapproval({
        :cancelUrl => "http://localhost:3000/samples/adaptive_payments/preapproval",
        :currencyCode => "USD",
        :returnUrl => "http://localhost:3000/samples/adaptive_payments/preapproval",
        :ipnNotificationUrl => "http://localhost:3000/samples/adaptive_payments/ipn_notify",
        :startingDate => "2015-10-10T00:00:00+00:00" })

      # Make API call & get response
      @preapproval_response = @api.preapproval(@preapproval)
      @preapproval_response.should be_success

      @preapproval_details_request = @api.build_preapproval_details()
      @preapproval_details_request.preapprovalKey = @preapproval_response.preapprovalKey
      @preapproval_details_response = @api.preapproval_details(@preapproval_details_request)
      @preapproval_details_response.should be_success
    end

    it "Cancel Preapproval" do
      @cancel_preapproval_response = @api.cancel_preapproval({
        :preapprovalKey => "PA-2T305990ET0354039" })
      @cancel_preapproval_response.should be_success
    end

    it "Refund" do
      @refund_response = @api.refund({
        :currencyCode => "USD",
        :payKey => "AP-5S482348KH512131U",
        :receiverList => {
          :receiver => [{
            :amount => 1.0,
            :email => "platfo_1255612361_per@gmail.com" }] } })
      @refund_response.should be_success
    end

    it "Get Payment option" do
      @get_payment_options_response = @api.get_payment_options({
        :payKey => "AP-5S482348KH512131U" })
      @get_payment_options_response.should be_success
    end

    it "Convert currency" do
      # Build request object
      @convert_currency = @api.build_convert_currency({
        :baseAmountList => {
          :currency => [{
            :code => "USD",
            :amount => 2.0 }] },
        :convertToCurrencyList => {
          :currencyCode => ["GBP"] } })

      # Make API call & get response
      @convert_currency_response = @api.convert_currency(@convert_currency)
      @convert_currency_response.should be_success
    end

    it "Validate ipn message" do
      @api.ipn_valid?("Invalid").should be_false
    end

  end
end
