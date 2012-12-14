IPN Overview :
------------
* PayPal Instant Payment Notification is a call back system that will get initiated once a tranction is completed(eg: When
a payment transaction completed successfully).
* You will receive the transaction related ipn variables on your call back url that you have specified in your request.
* You have to send this ipn variable back to PayPal system for verification, Upon verification PayPal will send
a response string "VERIFIED" or "INVALID".
* PayPal will continuously resend this ipn, if a wrong ipn is sent.

Validate IPN data :
-----------------

Add the following line in IPN Listener to validate the data:

```ruby
if PayPal::SDK::Core::API::IPN.valid?(request.raw_post)  # return true or false
  # params contains the data
end
```

IPN variables :
--------------

[Transaction]
-------------
* transaction_type
* action_type
* transaction[n].amount
* transaction[n].id
* transaction[n].id_for_sender
* transaction[n].invoiceId
* transaction[n].is_primary_receiver
* transaction[n].receiver
* transaction[n].refund_account_charged
* transaction[n].refund_amount
* transaction[n].refund_id
* transaction[n].status
* transaction[n].status_for _sender_txn,
* transaction[n].id_for_sender_txn
* transaction[n].pending_reason
* ipn_notification_url
* verify_sign
* notify_version
* test_ipn
* reverse_all_parallel_payments_on_error
* log_default_shipping_address_in_transaction

[BuyerInfo]
-----------
* sender_email
* fees_payer
* pin_type

[DisputeResolution]
-------------------
* reason_code

[RecurringPayment]
------------------
* current_number_of_payments
* current_period_attempts
* current_total_amount_of_all_payments
* date_of_month
* day_of_week
* ending_date
* max_amount_per_payment
* max_number_of_payments
* max_total_amount_of_all_payments
* payment_period
* starting_date
* payment_period


[Paymentinfo]
-------------
* pay_key
* payment_request_date
* preapproval_key
* memo
* payment_request_date
* preapproval_key
* currencyCode
* status
* return_url
* cancel_url
* approved
* charset
* trackingId

* For a full list of ipn variables you need to check log file, that Ipn Listener is logging into.

IPN Reference :
--------------
* You can refer IPN getting started guide at [https://www.x.com/developers/paypal/documentation-tools/ipn/gs_IPN]

