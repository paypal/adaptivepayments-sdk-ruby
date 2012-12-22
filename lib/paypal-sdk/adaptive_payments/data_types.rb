# Stub objects for AdaptivePayments
# Auto generated code

require 'paypal-sdk-core'

module PayPal::SDK
  module AdaptivePayments
    module DataTypes

      class DataType < Core::API::DataTypes::Base
        def self.load_members
          add_attribute :xmlns
          add_attribute :type, :namespace => :xsi
        end
      end

      class EnumType < Core::API::DataTypes::Enum
      end

      class AccountIdentifier < DataType
        def self.load_members
          object_of :email, String
          object_of :phone, PhoneNumberType
        end
      end



      class BaseAddress < DataType
        def self.load_members
          object_of :line1, String, :required => true
          object_of :line2, String
          object_of :city, String, :required => true
          object_of :state, String
          object_of :postalCode, String
          object_of :countryCode, String, :required => true
          object_of :type, String
        end
      end



      # Details about the end user of the application invoking this service. 
      class ClientDetailsType < DataType
        def self.load_members
          object_of :ipAddress, String
          object_of :deviceId, String
          object_of :applicationId, String
          object_of :model, String
          object_of :geoLocation, String
          object_of :customerType, String
          object_of :partnerName, String
          object_of :customerId, String
        end
      end



      class CurrencyType < DataType
        def self.load_members
          object_of :code, String, :required => true
          object_of :amount, Float, :required => true
        end
      end



      # This type contains the detailed error information resulting from the service operation. 
      class ErrorData < DataType
        def self.load_members
          object_of :errorId, Integer
          object_of :domain, String
          object_of :subdomain, String
          object_of :severity, ErrorSeverity
          object_of :category, ErrorCategory
          object_of :message, String
          object_of :exceptionId, String
          array_of :parameter, ErrorParameter
        end
      end



      class ErrorParameter < DataType
        def self.load_members
          add_attribute :name, :required => true
          object_of :value, String, :required => true
        end
      end



      # This specifies a fault, encapsulating error data, with specific error codes. 
      class FaultMessage < DataType
        def self.load_members
          object_of :responseEnvelope, ResponseEnvelope, :required => true
          array_of :error, ErrorData
        end
      end



      class PhoneNumberType < DataType
        def self.load_members
          object_of :countryCode, String, :required => true
          object_of :phoneNumber, String, :required => true
          object_of :extension, String
        end
      end



      # This specifies the list of parameters with every request to the service. 
      class RequestEnvelope < DataType
        def self.load_members
          # This specifies the required detail level that is needed by a client application pertaining to a particular data component (e.g., Item, Transaction, etc.). The detail level is specified in the DetailLevelCodeType which has all the enumerated values of the detail level for each component. 
          object_of :detailLevel, DetailLevelCode
          # This should be the standard RFC 3066 language identification tag, e.g., en_US. 
          object_of :errorLanguage, String, :required => true
        end
      end



      # This specifies a list of parameters with every response from a service. 
      class ResponseEnvelope < DataType
        def self.load_members
          object_of :timestamp, DateTime, :required => true
          # Application level acknowledgment code. 
          object_of :ack, AckCode, :required => true
          object_of :correlationId, String, :required => true
          object_of :build, String, :required => true
        end
      end



      #  AckCodeType This code identifies the acknowledgment code types that could be used to communicate the status of processing a (request) message to an application. This code would be used as part of a response message that contains an application level acknowledgment element. 
      class AckCode < EnumType
        self.options = { 'SUCCESS' => 'Success', 'FAILURE' => 'Failure', 'WARNING' => 'Warning', 'SUCCESSWITHWARNING' => 'SuccessWithWarning', 'FAILUREWITHWARNING' => 'FailureWithWarning' }
      end



      class DayOfWeek < EnumType
        self.options = { 'NODAYSPECIFIED' => 'NO_DAY_SPECIFIED', 'SUNDAY' => 'SUNDAY', 'MONDAY' => 'MONDAY', 'TUESDAY' => 'TUESDAY', 'WEDNESDAY' => 'WEDNESDAY', 'THURSDAY' => 'THURSDAY', 'FRIDAY' => 'FRIDAY', 'SATURDAY' => 'SATURDAY' }
      end



      #  DetailLevelCodeType 
      class DetailLevelCode < EnumType
        self.options = { 'RETURNALL' => 'ReturnAll' }
      end



      class ErrorCategory < EnumType
        self.options = { 'SYSTEM' => 'System', 'APPLICATION' => 'Application', 'REQUEST' => 'Request' }
      end



      class ErrorSeverity < EnumType
        self.options = { 'ERROR' => 'Error', 'WARNING' => 'Warning' }
      end



      class Address < DataType
        def self.load_members
          object_of :addresseeName, String
          object_of :baseAddress, BaseAddress, :required => true
          object_of :addressId, String
        end
      end



      class AddressList < DataType
        def self.load_members
          array_of :address, Address, :required => true
        end
      end



      # A list of ISO currency codes. 
      class CurrencyCodeList < DataType
        def self.load_members
          array_of :currencyCode, String, :required => true
        end
      end



      # A list of estimated currency conversions for a base currency. 
      class CurrencyConversionList < DataType
        def self.load_members
          object_of :baseAmount, CurrencyType, :required => true
          object_of :currencyList, CurrencyList, :required => true
        end
      end



      # A table that contains a list of estimated currency conversions for a base currency in each row. 
      class CurrencyConversionTable < DataType
        def self.load_members
          array_of :currencyConversionList, CurrencyConversionList, :required => true
        end
      end



      # A list of ISO currencies. 
      class CurrencyList < DataType
        def self.load_members
          array_of :currency, CurrencyType, :required => true
        end
      end



      # Customizable options that a client application can specify for display purposes. 
      class DisplayOptions < DataType
        def self.load_members
          object_of :emailHeaderImageUrl, String
          object_of :emailMarketingImageUrl, String
          object_of :headerImageUrl, String
          object_of :businessName, String
        end
      end



      class ErrorList < DataType
        def self.load_members
          array_of :error, ErrorData, :required => true
        end
      end



      class FundingConstraint < DataType
        def self.load_members
          object_of :allowedFundingType, FundingTypeList
        end
      end



      # FundingTypeInfo represents one allowed funding type. 
      class FundingTypeInfo < DataType
        def self.load_members
          object_of :fundingType, String, :required => true
        end
      end



      class FundingTypeList < DataType
        def self.load_members
          array_of :fundingTypeInfo, FundingTypeInfo, :required => true
        end
      end



      # Describes the conversion between 2 currencies. 
      class CurrencyConversion < DataType
        def self.load_members
          object_of :from, CurrencyType, :required => true
          object_of :to, CurrencyType, :required => true
          object_of :exchangeRate, Float, :required => true
        end
      end



      # Funding source information. 
      class FundingSource < DataType
        def self.load_members
          object_of :lastFourOfAccountNumber, String
          object_of :type, String, :required => true
          object_of :displayName, String
          object_of :fundingSourceId, String
          object_of :allowed, Boolean
        end
      end



      # Amount to be charged to a particular funding source. 
      class FundingPlanCharge < DataType
        def self.load_members
          object_of :charge, CurrencyType, :required => true
          object_of :fundingSource, FundingSource, :required => true
        end
      end



      # FundingPlan describes the funding sources to be used for a specific payment. 
      class FundingPlan < DataType
        def self.load_members
          object_of :fundingPlanId, String, :required => true
          object_of :fundingAmount, CurrencyType, :required => true
          object_of :backupFundingSource, FundingSource
          object_of :senderFees, CurrencyType
          object_of :currencyConversion, CurrencyConversion
          array_of :charge, FundingPlanCharge, :required => true
        end
      end



      # Details about the party that initiated this payment. The API user is making this payment on behalf of the initiator. The initiator can simply be an institution or a customer of the institution. 
      class InitiatingEntity < DataType
        def self.load_members
          object_of :institutionCustomer, InstitutionCustomer
        end
      end



      # The customer of the initiating institution 
      class InstitutionCustomer < DataType
        def self.load_members
          # The unique identifier as assigned to the institution. 
          object_of :institutionId, String, :required => true
          # The first (given) name of the end consumer as known by the institution. 
          object_of :firstName, String, :required => true
          # The last (family) name of the end consumer as known by the institution. 
          object_of :lastName, String, :required => true
          # The full name of the end consumer as known by the institution. 
          object_of :displayName, String, :required => true
          # The unique identifier as assigned to the end consumer by the institution. 
          object_of :institutionCustomerId, String, :required => true
          # The two-character ISO country code of the home country of the end consumer 
          object_of :countryCode, String, :required => true
          object_of :email, String
        end
      end



      # Describes an individual item for an invoice. 
      class InvoiceItem < DataType
        def self.load_members
          object_of :name, String
          object_of :identifier, String
          object_of :price, Float
          object_of :itemPrice, Float
          object_of :itemCount, Integer
        end
      end



      # Describes a payment for a particular receiver (merchant), contains list of additional per item details. 
      class InvoiceData < DataType
        def self.load_members
          array_of :item, InvoiceItem
          object_of :totalTax, Float
          object_of :totalShipping, Float
        end
      end



      # The error that resulted from an attempt to make a payment to a receiver. 
      class PayError < DataType
        def self.load_members
          object_of :receiver, Receiver, :required => true
          object_of :error, ErrorData, :required => true
        end
      end



      class PayErrorList < DataType
        def self.load_members
          array_of :payError, PayError, :required => true
        end
      end



      # PaymentInfo represents the payment attempt made to a Receiver of a PayRequest. If the execution of the payment has not yet completed, there will not be any transaction details. 
      class PaymentInfo < DataType
        def self.load_members
          object_of :transactionId, String
          object_of :transactionStatus, String
          object_of :receiver, Receiver, :required => true
          object_of :refundedAmount, Float
          object_of :pendingRefund, Boolean
          object_of :senderTransactionId, String
          object_of :senderTransactionStatus, String
          object_of :pendingReason, String
        end
      end



      class PaymentInfoList < DataType
        def self.load_members
          array_of :paymentInfo, PaymentInfo, :required => true
        end
      end



      # Receiver is the party where funds are transferred to. A primary receiver receives a payment directly from the sender in a chained split payment. A primary receiver should not be specified when making a single or parallel split payment. 
      class Receiver < DataType
        def self.load_members
          object_of :amount, Float, :required => true
          object_of :email, String
          object_of :phone, PhoneNumberType
          object_of :primary, Boolean
          object_of :invoiceId, String
          object_of :paymentType, String
          object_of :paymentSubType, String
        end
      end



      class ReceiverList < DataType
        def self.load_members
          array_of :receiver, Receiver, :required => true
        end
      end



      # The sender identifier type contains information to identify a PayPal account. 
      class ReceiverIdentifier < AccountIdentifier
        def self.load_members
        end
      end



      # Options that apply to the receiver of a payment, allows setting additional details for payment using invoice. 
      class ReceiverOptions < DataType
        def self.load_members
          object_of :description, String
          object_of :customId, String
          object_of :invoiceData, InvoiceData
          object_of :receiver, ReceiverIdentifier, :required => true
          object_of :referrerCode, String
        end
      end



      # RefundInfo represents the refund attempt made to a Receiver of a PayRequest. 
      class RefundInfo < DataType
        def self.load_members
          object_of :receiver, Receiver, :required => true
          object_of :refundStatus, String
          object_of :refundNetAmount, Float
          object_of :refundFeeAmount, Float
          object_of :refundGrossAmount, Float
          object_of :totalOfAllRefunds, Float
          object_of :refundHasBecomeFull, Boolean
          object_of :encryptedRefundTransactionId, String
          object_of :refundTransactionStatus, String
          object_of :errorList, ErrorList
        end
      end



      class RefundInfoList < DataType
        def self.load_members
          array_of :refundInfo, RefundInfo, :required => true
        end
      end



      # Options that apply to the sender of a payment. 
      class SenderOptions < DataType
        def self.load_members
          # Require the user to select a shipping address during the web flow. 
          object_of :requireShippingAddressSelection, Boolean
          object_of :referrerCode, String
        end
      end



      # Details about the payer's tax info passed in by the merchant or partner. 
      class TaxIdDetails < DataType
        def self.load_members
          # Tax id of the merchant/business. 
          object_of :taxId, String
          # Tax type of the Tax Id. 
          object_of :taxIdType, String
        end
      end



      # The sender identifier type contains information to identify a PayPal account. 
      class SenderIdentifier < AccountIdentifier
        def self.load_members
          object_of :useCredentials, Boolean
          object_of :taxIdDetails, TaxIdDetails
        end
      end



      class UserLimit < DataType
        def self.load_members
          object_of :limitType, String, :required => true
          object_of :limitAmount, CurrencyType, :required => true
        end
      end



      # This type contains the detailed warning information resulting from the service operation. 
      class WarningData < DataType
        def self.load_members
          object_of :warningId, Integer
          object_of :message, String
        end
      end



      class WarningDataList < DataType
        def self.load_members
          array_of :warningData, WarningData, :required => true
        end
      end



      # The request to cancel a Preapproval. 
      class CancelPreapprovalRequest < DataType
        def self.load_members
          object_of :requestEnvelope, RequestEnvelope, :required => true
          object_of :preapprovalKey, String, :required => true
        end
      end



      # The result of the CancelPreapprovalRequest. 
      class CancelPreapprovalResponse < DataType
        def self.load_members
          object_of :responseEnvelope, ResponseEnvelope, :required => true
          array_of :error, ErrorData
        end
      end



      # The request to confirm a Preapproval. 
      class ConfirmPreapprovalRequest < DataType
        def self.load_members
          object_of :requestEnvelope, RequestEnvelope, :required => true
          object_of :preapprovalKey, String, :required => true
          object_of :fundingSourceId, String
          object_of :pin, String
        end
      end



      # The result of the ConfirmPreapprovalRequest. 
      class ConfirmPreapprovalResponse < DataType
        def self.load_members
          object_of :responseEnvelope, ResponseEnvelope, :required => true
          array_of :error, ErrorData
        end
      end



      # A request to convert one or more currencies into their estimated values in other currencies. 
      class ConvertCurrencyRequest < DataType
        def self.load_members
          object_of :requestEnvelope, RequestEnvelope, :required => true
          object_of :baseAmountList, CurrencyList, :required => true
          object_of :convertToCurrencyList, CurrencyCodeList, :required => true
          # The two-character ISO country code where fx suppposed to happen 
          object_of :countryCode, String
          object_of :conversionType, String
        end
      end



      # A response that contains a table of estimated converted currencies based on the Convert Currency Request. 
      class ConvertCurrencyResponse < DataType
        def self.load_members
          object_of :responseEnvelope, ResponseEnvelope, :required => true
          object_of :estimatedAmountTable, CurrencyConversionTable, :required => true
          array_of :error, ErrorData
        end
      end



      # The request to execute the payment request. 
      class ExecutePaymentRequest < DataType
        def self.load_members
          object_of :requestEnvelope, RequestEnvelope, :required => true
          object_of :payKey, String, :required => true
          # Describes the action that is performed by this API 
          object_of :actionType, String
          object_of :fundingPlanId, String
        end
      end



      # The result of a payment execution. 
      class ExecutePaymentResponse < DataType
        def self.load_members
          object_of :responseEnvelope, ResponseEnvelope, :required => true
          object_of :paymentExecStatus, String, :required => true
          object_of :payErrorList, PayErrorList
          array_of :error, ErrorData
        end
      end



      # The request to get the allowed funding sources available for a preapproval. 
      class GetAllowedFundingSourcesRequest < DataType
        def self.load_members
          object_of :requestEnvelope, RequestEnvelope, :required => true
          object_of :key, String, :required => true
        end
      end



      # The response to get the backup funding sources available for a preapproval. 
      class GetAllowedFundingSourcesResponse < DataType
        def self.load_members
          object_of :responseEnvelope, ResponseEnvelope, :required => true
          array_of :fundingSource, FundingSource
          array_of :error, ErrorData
        end
      end



      # The request to get the options of a payment request. 
      class GetPaymentOptionsRequest < DataType
        def self.load_members
          object_of :requestEnvelope, RequestEnvelope, :required => true
          object_of :payKey, String, :required => true
        end
      end



      # The response message for the GetPaymentOption request 
      class GetPaymentOptionsResponse < DataType
        def self.load_members
          object_of :responseEnvelope, ResponseEnvelope, :required => true
          object_of :initiatingEntity, InitiatingEntity
          object_of :displayOptions, DisplayOptions
          object_of :shippingAddressId, String
          object_of :senderOptions, SenderOptions
          array_of :receiverOptions, ReceiverOptions
          array_of :error, ErrorData
        end
      end



      # The request to look up the details of a PayRequest. The PaymentDetailsRequest can be made with either a payKey, trackingId, or a transactionId of the PayRequest. 
      class PaymentDetailsRequest < DataType
        def self.load_members
          object_of :requestEnvelope, RequestEnvelope, :required => true
          object_of :payKey, String
          object_of :transactionId, String
          object_of :trackingId, String
        end
      end



      # The details of the PayRequest as specified in the Pay operation. 
      class PaymentDetailsResponse < DataType
        def self.load_members
          object_of :responseEnvelope, ResponseEnvelope, :required => true
          object_of :cancelUrl, String, :required => true
          object_of :currencyCode, String, :required => true
          object_of :ipnNotificationUrl, String
          object_of :memo, String
          object_of :paymentInfoList, PaymentInfoList, :required => true
          object_of :returnUrl, String, :required => true
          object_of :senderEmail, String
          object_of :status, String, :required => true
          object_of :trackingId, String
          object_of :payKey, String, :required => true
          object_of :actionType, String, :required => true
          object_of :feesPayer, String, :required => true
          object_of :reverseAllParallelPaymentsOnError, Boolean
          object_of :preapprovalKey, String
          object_of :fundingConstraint, FundingConstraint
          object_of :sender, SenderIdentifier
          array_of :error, ErrorData
        end
      end



      # The PayRequest contains the payment instructions to make from sender to receivers. 
      class PayRequest < DataType
        def self.load_members
          object_of :requestEnvelope, RequestEnvelope, :required => true
          object_of :clientDetails, ClientDetailsType
          object_of :actionType, String, :required => true
          object_of :cancelUrl, String, :required => true
          object_of :currencyCode, String, :required => true
          object_of :feesPayer, String
          object_of :ipnNotificationUrl, String
          object_of :memo, String
          object_of :pin, String
          object_of :preapprovalKey, String
          object_of :receiverList, ReceiverList, :required => true
          object_of :reverseAllParallelPaymentsOnError, Boolean
          object_of :senderEmail, String
          object_of :returnUrl, String, :required => true
          object_of :trackingId, String
          object_of :fundingConstraint, FundingConstraint
          object_of :sender, SenderIdentifier
        end
      end



      # The PayResponse contains the result of the Pay operation. The payKey and execution status of the request should always be provided. 
      class PayResponse < DataType
        def self.load_members
          object_of :responseEnvelope, ResponseEnvelope, :required => true
          object_of :payKey, String, :required => true
          object_of :paymentExecStatus, String, :required => true
          object_of :payErrorList, PayErrorList
          object_of :defaultFundingPlan, FundingPlan
          object_of :warningDataList, WarningDataList
          array_of :error, ErrorData
        end
      end



      # The request to look up the details of a Preapproval. 
      class PreapprovalDetailsRequest < DataType
        def self.load_members
          object_of :requestEnvelope, RequestEnvelope, :required => true
          object_of :preapprovalKey, String, :required => true
          object_of :getBillingAddress, Boolean
        end
      end



      # The details of the Preapproval as specified in the Preapproval operation. 
      class PreapprovalDetailsResponse < DataType
        def self.load_members
          object_of :responseEnvelope, ResponseEnvelope, :required => true
          object_of :approved, Boolean, :required => true
          object_of :cancelUrl, String, :required => true
          object_of :curPayments, Integer, :required => true
          object_of :curPaymentsAmount, Float, :required => true
          object_of :curPeriodAttempts, Integer
          object_of :curPeriodEndingDate, DateTime
          object_of :currencyCode, String, :required => true
          object_of :dateOfMonth, Integer
          object_of :dayOfWeek, DayOfWeek
          object_of :endingDate, DateTime
          object_of :maxAmountPerPayment, Float
          object_of :maxNumberOfPayments, Integer
          object_of :maxNumberOfPaymentsPerPeriod, Integer
          object_of :maxTotalAmountOfAllPayments, Float
          object_of :paymentPeriod, String
          object_of :pinType, String
          object_of :returnUrl, String, :required => true
          object_of :senderEmail, String
          object_of :memo, String
          object_of :startingDate, DateTime, :required => true
          object_of :status, String, :required => true
          object_of :ipnNotificationUrl, String
          object_of :addressList, AddressList
          object_of :feesPayer, String
          object_of :displayMaxTotalAmount, Boolean
          array_of :error, ErrorData
        end
      end



      # A request to create a Preapproval. A Preapproval is an agreement between a Paypal account holder (the sender) and the API caller (the service invoker) to make payment(s) on the the sender's behalf with various limitations defined. 
      class PreapprovalRequest < DataType
        def self.load_members
          object_of :requestEnvelope, RequestEnvelope, :required => true
          object_of :clientDetails, ClientDetailsType
          object_of :cancelUrl, String, :required => true
          object_of :currencyCode, String, :required => true
          object_of :dateOfMonth, Integer
          object_of :dayOfWeek, DayOfWeek
          object_of :endingDate, DateTime
          object_of :maxAmountPerPayment, Float
          object_of :maxNumberOfPayments, Integer
          object_of :maxNumberOfPaymentsPerPeriod, Integer
          object_of :maxTotalAmountOfAllPayments, Float
          object_of :paymentPeriod, String
          object_of :returnUrl, String, :required => true
          object_of :memo, String
          object_of :ipnNotificationUrl, String
          object_of :senderEmail, String
          object_of :startingDate, DateTime, :required => true
          object_of :pinType, String
          object_of :feesPayer, String
          object_of :displayMaxTotalAmount, Boolean
          object_of :requireInstantFundingSource, Boolean
        end
      end



      # The result of the PreapprovalRequest is a preapprovalKey. 
      class PreapprovalResponse < DataType
        def self.load_members
          object_of :responseEnvelope, ResponseEnvelope, :required => true
          object_of :preapprovalKey, String, :required => true
          array_of :error, ErrorData
        end
      end



      # A request to make a refund based on various criteria. A refund can be made against the entire payKey, an individual transaction belonging to a payKey, a tracking id, or a specific receiver of a payKey. 
      class RefundRequest < DataType
        def self.load_members
          object_of :requestEnvelope, RequestEnvelope, :required => true
          object_of :currencyCode, String
          object_of :payKey, String
          object_of :transactionId, String
          object_of :trackingId, String
          object_of :receiverList, ReceiverList
        end
      end



      # The result of a Refund request. 
      class RefundResponse < DataType
        def self.load_members
          object_of :responseEnvelope, ResponseEnvelope, :required => true
          object_of :currencyCode, String, :required => true
          object_of :refundInfoList, RefundInfoList, :required => true
          array_of :error, ErrorData
        end
      end



      # The request to set the options of a payment request. 
      class SetPaymentOptionsRequest < DataType
        def self.load_members
          object_of :requestEnvelope, RequestEnvelope, :required => true
          object_of :payKey, String, :required => true
          object_of :initiatingEntity, InitiatingEntity
          object_of :displayOptions, DisplayOptions
          object_of :shippingAddressId, String
          object_of :senderOptions, SenderOptions
          array_of :receiverOptions, ReceiverOptions
        end
      end



      # The response message for the SetPaymentOption request 
      class SetPaymentOptionsResponse < DataType
        def self.load_members
          object_of :responseEnvelope, ResponseEnvelope, :required => true
          array_of :error, ErrorData
        end
      end



      # The request to get the funding plans available for a payment. 
      class GetFundingPlansRequest < DataType
        def self.load_members
          object_of :requestEnvelope, RequestEnvelope, :required => true
          object_of :payKey, String, :required => true
        end
      end



      # The response to get the funding plans available for a payment. 
      class GetFundingPlansResponse < DataType
        def self.load_members
          object_of :responseEnvelope, ResponseEnvelope, :required => true
          array_of :fundingPlan, FundingPlan
          array_of :error, ErrorData
        end
      end



      # The request to get the addresses available for a payment. 
      class GetAvailableShippingAddressesRequest < DataType
        def self.load_members
          object_of :requestEnvelope, RequestEnvelope, :required => true
          # The key for which to provide the available addresses. Key can be an AdaptivePayments key such as payKey or preapprovalKey 
          object_of :key, String, :required => true
        end
      end



      # The response to get the shipping addresses available for a payment. 
      class GetAvailableShippingAddressesResponse < DataType
        def self.load_members
          object_of :responseEnvelope, ResponseEnvelope, :required => true
          array_of :availableAddress, Address
          array_of :error, ErrorData
        end
      end



      # The request to get the addresses available for a payment. 
      class GetShippingAddressesRequest < DataType
        def self.load_members
          object_of :requestEnvelope, RequestEnvelope, :required => true
          # The key for which to provide the available addresses. Key can be an AdaptivePayments key such as payKey or preapprovalKey 
          object_of :key, String, :required => true
        end
      end



      # The response to get the shipping addresses available for a payment. 
      class GetShippingAddressesResponse < DataType
        def self.load_members
          object_of :responseEnvelope, ResponseEnvelope, :required => true
          object_of :selectedAddress, Address
          array_of :error, ErrorData
        end
      end



      # The request to get the remaining limits for a user 
      class GetUserLimitsRequest < DataType
        def self.load_members
          object_of :requestEnvelope, RequestEnvelope, :required => true
          # The account identifier for the user 
          object_of :user, AccountIdentifier, :required => true
          object_of :country, String, :required => true
          object_of :currencyCode, String, :required => true
          # List of limit types 
          array_of :limitType, String, :required => true
        end
      end



      # A response that contains a list of remaining limits 
      class GetUserLimitsResponse < DataType
        def self.load_members
          object_of :responseEnvelope, ResponseEnvelope, :required => true
          array_of :userLimit, UserLimit, :required => true
          object_of :warningDataList, WarningDataList
          array_of :error, ErrorData
        end
      end





      constants.each do |data_type_klass|
        data_type_klass = const_get(data_type_klass)
        data_type_klass.load_members if defined? data_type_klass.load_members
      end

    end
  end
end
