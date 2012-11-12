# AdaptivePayments[ Work in progress !! ]

SDK for AdaptivePayments.

## Installation

Add this line to your application's Gemfile:

    gem 'paypal-sdk-adaptivepayments'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install paypal-sdk-adaptivepayments

## Create API object and Configuration

Create API object:

    api = PayPal::SDK::AdaptivePayments::API.new

Override configuration while creating a object:

    api = PayPal::SDK::AdaptivePayments::API.new(:development)
    api = PayPal::SDK::AdaptivePayments::API.new(:development, :app_id => "XYZ")
    api = PayPal::SDK::AdaptivePayments::API.new(:app_id => "XYZ")    # Take default environment.

Change configuration:

    api.set_config :testing
    api.set_config :testing, app_id => "XYZ"


## Build Request Object

To make api request, we need to build a request object.

    # To build a empty request object for convert currency
    convert_currency_request = api.build_convert_currency()

    # To build a request object with default data
    convert_currency_request = api.build_convert_currency( :baseAmountList => { :currency => [ { :code => "USD", :amount => "5.0" } ] } )

The Build method can be access with camelcase or underscore:

    api = api.build_convert_currency()
    # (or)
    api = api.BuildConvertCurrency()

## Assign value to members

Members can be access with camelcase or underscore format.

    pay_request.receiverList.receiver[0].amount = 1.0
    # With underscore
    pay_request.receiver_list.receiver[0].email  = "platfo_1255612361_per@gmail.com"

To Assign multiple values:

    pay_request.receiverList.receiver[0] = { :amount => "1.0", :email => "platfo_1255612361_per@gmail.com" }

To Get members list for the given object( For Reference ):

    convert_currency_request.members
    convert_currency_request.baseAmountList.members

## Make API Request

Make api call with request object:

    pay_response = api.pay(pay_request)

Make api call with hash:

    pay_response = api.pay({:baseAmountList => { :currency => [ { :code => "USD", :amount => "5.0" } ] }})

## Access values from response object

To get response status:

    pay_response.responseEnvelope.ack


## Example

    require 'paypal-sdk-adaptivepayments'
    @api = PayPal::SDK::AdaptivePayments::API.new

    # Build request object
    @pay_request = @api.build_pay()
    @pay_request.actionType   = "PAY"
    @pay_request.cancelUrl    = "http://localhost:3000/adaptive_payments/pay"
    @pay_request.currencyCode = "USD"
    @pay_request.feesPayer    = "SENDER"
    @pay_request.receiverList.receiver[0].amount = 1.0
    @pay_request.receiverList.receiver[0].email  = "platfo_1255612361_per@gmail.com"
    @pay_request.returnUrl    = "http://localhost:3000/adaptive_payments/pay"
    @pay_request.fundingConstraint.allowedFundingType.fundingTypeInfo = []
    @pay_request.sender.email = "platfo_1255077030_biz@gmail.com"

    # Make API call & get response
    @pay_response = @api.pay(@pay_request)

    # Access response
    @pay_response.responseEnvelope.ack

