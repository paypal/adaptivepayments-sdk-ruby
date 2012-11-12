require 'spec_helper'

describe "ConvertCurrency" do

  before :all do
    @client = PayPal::SDK::AdaptivePayments::API.new
  end

  it "with hash" do
    response = @client.convert_currency({
          "baseAmountList"        => { "currency" => [ { "code" => "USD", "amount" => "2.0"} ]},
          "convertToCurrencyList" => { "currencyCode" => ["GBP"] } })
    response.response_envelope.ack.should eql "Success"
  end

  it "with request object" do
    convert_currency_request = @client.build_convert_currency()
    convert_currency_request.baseAmountList.currency[0].code   = "USD"
    convert_currency_request.baseAmountList.currency[0].amount = 2.0
    convert_currency_request.convertToCurrencyList.currencyCode = [ "GBP" ]

    response = @client.convert_currency(convert_currency_request)
    response.response_envelope.ack.should eql "Success"
  end

end
