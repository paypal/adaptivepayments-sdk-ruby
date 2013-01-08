require 'spec_helper'

describe "AdaptivePayments" do

  before :all do
    @api = PayPal::SDK::AdaptivePayments::API.new
    @api_with_cert = PayPal::SDK::AdaptivePayments::API.new(:with_certificate)
  end

  describe "Examples" do
    it "Pay" do
      # Build request object
      @pay_request = @api.build_pay()
      @pay_request.actionType         = "PAY"
      @pay_request.cancelUrl          = "https://paypal-sdk-samples.herokuapp.com/adaptive_payments/pay"
      @pay_request.currencyCode       = "USD"
      @pay_request.feesPayer          = "SENDER"
      @pay_request.ipnNotificationUrl = "https://paypal-sdk-samples.herokuapp.com/adaptive_payments/ipn_notify"
      @pay_request.receiverList.receiver[0].amount = 1.0
      @pay_request.receiverList.receiver[0].email  = "platfo_1255612361_per@gmail.com"
      @pay_request.returnUrl          = "https://paypal-sdk-samples.herokuapp.com/adaptive_payments/pay"

      # Make API call & get response
      @pay_response = @api.pay(@pay_request)
      @pay_response.responseEnvelope.ack.should eql "Success"

      @payment_details_request = @api.build_payment_details()
      @payment_details_request.payKey = @pay_response.payKey
      @payment_details_response = @api.payment_details(@payment_details_request)
      @payment_details_response.responseEnvelope.ack.should eql "Success"

      # Make API call & get response
      @pay_response = @api_with_cert.pay(@pay_request)
      @pay_response.responseEnvelope.ack.should eql "Success"

      @payment_details_request = @api_with_cert.build_payment_details()
      @payment_details_request.payKey = @pay_response.payKey
      @payment_details_response = @api_with_cert.payment_details(@payment_details_request)
      @payment_details_response.responseEnvelope.ack.should eql "Success"
    end

    it "Preapproval" do
      # Build request object
      @preapproval_request = @api.build_preapproval()
      @preapproval_request.cancelUrl          = "https://paypal-sdk-samples.herokuapp.com/adaptive_payments/preapproval"
      @preapproval_request.currencyCode       = "USD"
      @preapproval_request.returnUrl          = "https://paypal-sdk-samples.herokuapp.com/adaptive_payments/preapproval"
      @preapproval_request.ipnNotificationUrl = "https://paypal-sdk-samples.herokuapp.com/adaptive_payments/ipn_notify"
      @preapproval_request.startingDate       = "2015-10-10T00:00:00+00:00"

      # Make API call & get response
      @preapproval_response = @api.preapproval(@preapproval_request)
      @preapproval_response.responseEnvelope.ack.should eql "Success"

      @preapproval_details_request = @api.build_preapproval_details()
      @preapproval_details_request.preapprovalKey = @preapproval_response.preapprovalKey
      @preapproval_details_response = @api.preapproval_details(@preapproval_details_request)
      @preapproval_details_response.responseEnvelope.ack.should eql "Success"
    end

    it "Convert currency" do
      # Build request object
      @convert_currency_request = @api.build_convert_currency()
      @convert_currency_request.baseAmountList.currency[0].code   = "USD"
      @convert_currency_request.baseAmountList.currency[0].amount = 2.0
      @convert_currency_request.convertToCurrencyList.currencyCode = ["GBP"]

      # Make API call & get response
      @convert_currency_response = @api.convert_currency(@convert_currency_request)
      @convert_currency_response.responseEnvelope.ack.should eql "Success"
    end



  end
end
