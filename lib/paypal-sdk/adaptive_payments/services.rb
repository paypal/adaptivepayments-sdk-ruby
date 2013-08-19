require 'paypal-sdk-core'

# AUTO GENERATED code for AdaptivePayments
module PayPal::SDK
  module AdaptivePayments

	  # Service Version
	  SERVICE_VERSION = "1.8.5"
	  # Service Name
	  SERVICE_NAME = "AdaptivePayments"

    module Services
      include DataTypes


      # Service Call: CancelPreapproval
      # @param CancelPreapprovalRequest
      # @return CancelPreapprovalResponse
      def CancelPreapproval(options = {} , http_header = {})
        request_object  = BuildCancelPreapproval(options)
        request_hash    = request_object.to_hash
        response_hash   = request("CancelPreapproval", request_hash, http_header)
        CancelPreapprovalResponse.new(response_hash)
      end
      alias_method :cancel_preapproval, :CancelPreapproval

      def BuildCancelPreapproval(options = {}, &block)
        klass     = CancelPreapprovalRequest
        object = options.is_a?(klass) ? options : klass.new(options || {})
        object.instance_eval(&block) if block
        object
      end
      alias_method :build_cancel_preapproval, :BuildCancelPreapproval

      # Service Call: ConfirmPreapproval
      # @param ConfirmPreapprovalRequest
      # @return ConfirmPreapprovalResponse
      def ConfirmPreapproval(options = {} , http_header = {})
        request_object  = BuildConfirmPreapproval(options)
        request_hash    = request_object.to_hash
        response_hash   = request("ConfirmPreapproval", request_hash, http_header)
        ConfirmPreapprovalResponse.new(response_hash)
      end
      alias_method :confirm_preapproval, :ConfirmPreapproval

      def BuildConfirmPreapproval(options = {}, &block)
        klass     = ConfirmPreapprovalRequest
        object = options.is_a?(klass) ? options : klass.new(options || {})
        object.instance_eval(&block) if block
        object
      end
      alias_method :build_confirm_preapproval, :BuildConfirmPreapproval

      # Service Call: ConvertCurrency
      # @param ConvertCurrencyRequest
      # @return ConvertCurrencyResponse
      def ConvertCurrency(options = {} , http_header = {})
        request_object  = BuildConvertCurrency(options)
        request_hash    = request_object.to_hash
        response_hash   = request("ConvertCurrency", request_hash, http_header)
        ConvertCurrencyResponse.new(response_hash)
      end
      alias_method :convert_currency, :ConvertCurrency

      def BuildConvertCurrency(options = {}, &block)
        klass     = ConvertCurrencyRequest
        object = options.is_a?(klass) ? options : klass.new(options || {})
        object.instance_eval(&block) if block
        object
      end
      alias_method :build_convert_currency, :BuildConvertCurrency

      # Service Call: ExecutePayment
      # @param ExecutePaymentRequest
      # @return ExecutePaymentResponse
      def ExecutePayment(options = {} , http_header = {})
        request_object  = BuildExecutePayment(options)
        request_hash    = request_object.to_hash
        response_hash   = request("ExecutePayment", request_hash, http_header)
        ExecutePaymentResponse.new(response_hash)
      end
      alias_method :execute_payment, :ExecutePayment

      def BuildExecutePayment(options = {}, &block)
        klass     = ExecutePaymentRequest
        object = options.is_a?(klass) ? options : klass.new(options || {})
        object.instance_eval(&block) if block
        object
      end
      alias_method :build_execute_payment, :BuildExecutePayment

      # Service Call: GetAllowedFundingSources
      # @param GetAllowedFundingSourcesRequest
      # @return GetAllowedFundingSourcesResponse
      def GetAllowedFundingSources(options = {} , http_header = {})
        request_object  = BuildGetAllowedFundingSources(options)
        request_hash    = request_object.to_hash
        response_hash   = request("GetAllowedFundingSources", request_hash, http_header)
        GetAllowedFundingSourcesResponse.new(response_hash)
      end
      alias_method :get_allowed_funding_sources, :GetAllowedFundingSources

      def BuildGetAllowedFundingSources(options = {}, &block)
        klass     = GetAllowedFundingSourcesRequest
        object = options.is_a?(klass) ? options : klass.new(options || {})
        object.instance_eval(&block) if block
        object
      end
      alias_method :build_get_allowed_funding_sources, :BuildGetAllowedFundingSources

      # Service Call: GetPaymentOptions
      # @param GetPaymentOptionsRequest
      # @return GetPaymentOptionsResponse
      def GetPaymentOptions(options = {} , http_header = {})
        request_object  = BuildGetPaymentOptions(options)
        request_hash    = request_object.to_hash
        response_hash   = request("GetPaymentOptions", request_hash, http_header)
        GetPaymentOptionsResponse.new(response_hash)
      end
      alias_method :get_payment_options, :GetPaymentOptions

      def BuildGetPaymentOptions(options = {}, &block)
        klass     = GetPaymentOptionsRequest
        object = options.is_a?(klass) ? options : klass.new(options || {})
        object.instance_eval(&block) if block
        object
      end
      alias_method :build_get_payment_options, :BuildGetPaymentOptions

      # Service Call: PaymentDetails
      # @param PaymentDetailsRequest
      # @return PaymentDetailsResponse
      def PaymentDetails(options = {} , http_header = {})
        request_object  = BuildPaymentDetails(options)
        request_hash    = request_object.to_hash
        response_hash   = request("PaymentDetails", request_hash, http_header)
        PaymentDetailsResponse.new(response_hash)
      end
      alias_method :payment_details, :PaymentDetails

      def BuildPaymentDetails(options = {}, &block)
        klass     = PaymentDetailsRequest
        object = options.is_a?(klass) ? options : klass.new(options || {})
        object.instance_eval(&block) if block
        object
      end
      alias_method :build_payment_details, :BuildPaymentDetails

      # Service Call: Pay
      # @param PayRequest
      # @return PayResponse
      def Pay(options = {} , http_header = {})
        request_object  = BuildPay(options)
        request_hash    = request_object.to_hash
        response_hash   = request("Pay", request_hash, http_header)
        PayResponse.new(response_hash)
      end
      alias_method :pay, :Pay

      def BuildPay(options = {}, &block)
        klass     = PayRequest
        object = options.is_a?(klass) ? options : klass.new(options || {})
        object.instance_eval(&block) if block
        object
      end
      alias_method :build_pay, :BuildPay

      # Service Call: PreapprovalDetails
      # @param PreapprovalDetailsRequest
      # @return PreapprovalDetailsResponse
      def PreapprovalDetails(options = {} , http_header = {})
        request_object  = BuildPreapprovalDetails(options)
        request_hash    = request_object.to_hash
        response_hash   = request("PreapprovalDetails", request_hash, http_header)
        PreapprovalDetailsResponse.new(response_hash)
      end
      alias_method :preapproval_details, :PreapprovalDetails

      def BuildPreapprovalDetails(options = {}, &block)
        klass     = PreapprovalDetailsRequest
        object = options.is_a?(klass) ? options : klass.new(options || {})
        object.instance_eval(&block) if block
        object
      end
      alias_method :build_preapproval_details, :BuildPreapprovalDetails

      # Service Call: Preapproval
      # @param PreapprovalRequest
      # @return PreapprovalResponse
      def Preapproval(options = {} , http_header = {})
        request_object  = BuildPreapproval(options)
        request_hash    = request_object.to_hash
        response_hash   = request("Preapproval", request_hash, http_header)
        PreapprovalResponse.new(response_hash)
      end
      alias_method :preapproval, :Preapproval

      def BuildPreapproval(options = {}, &block)
        klass     = PreapprovalRequest
        object = options.is_a?(klass) ? options : klass.new(options || {})
        object.instance_eval(&block) if block
        object
      end
      alias_method :build_preapproval, :BuildPreapproval

      # Service Call: Refund
      # @param RefundRequest
      # @return RefundResponse
      def Refund(options = {} , http_header = {})
        request_object  = BuildRefund(options)
        request_hash    = request_object.to_hash
        response_hash   = request("Refund", request_hash, http_header)
        RefundResponse.new(response_hash)
      end
      alias_method :refund, :Refund

      def BuildRefund(options = {}, &block)
        klass     = RefundRequest
        object = options.is_a?(klass) ? options : klass.new(options || {})
        object.instance_eval(&block) if block
        object
      end
      alias_method :build_refund, :BuildRefund

      # Service Call: SetPaymentOptions
      # @param SetPaymentOptionsRequest
      # @return SetPaymentOptionsResponse
      def SetPaymentOptions(options = {} , http_header = {})
        request_object  = BuildSetPaymentOptions(options)
        request_hash    = request_object.to_hash
        response_hash   = request("SetPaymentOptions", request_hash, http_header)
        SetPaymentOptionsResponse.new(response_hash)
      end
      alias_method :set_payment_options, :SetPaymentOptions

      def BuildSetPaymentOptions(options = {}, &block)
        klass     = SetPaymentOptionsRequest
        object = options.is_a?(klass) ? options : klass.new(options || {})
        object.instance_eval(&block) if block
        object
      end
      alias_method :build_set_payment_options, :BuildSetPaymentOptions

      # Service Call: GetFundingPlans
      # @param GetFundingPlansRequest
      # @return GetFundingPlansResponse
      def GetFundingPlans(options = {} , http_header = {})
        request_object  = BuildGetFundingPlans(options)
        request_hash    = request_object.to_hash
        response_hash   = request("GetFundingPlans", request_hash, http_header)
        GetFundingPlansResponse.new(response_hash)
      end
      alias_method :get_funding_plans, :GetFundingPlans

      def BuildGetFundingPlans(options = {}, &block)
        klass     = GetFundingPlansRequest
        object = options.is_a?(klass) ? options : klass.new(options || {})
        object.instance_eval(&block) if block
        object
      end
      alias_method :build_get_funding_plans, :BuildGetFundingPlans

      # Service Call: GetAvailableShippingAddresses
      # @param GetAvailableShippingAddressesRequest
      # @return GetAvailableShippingAddressesResponse
      def GetAvailableShippingAddresses(options = {} , http_header = {})
        request_object  = BuildGetAvailableShippingAddresses(options)
        request_hash    = request_object.to_hash
        response_hash   = request("GetAvailableShippingAddresses", request_hash, http_header)
        GetAvailableShippingAddressesResponse.new(response_hash)
      end
      alias_method :get_available_shipping_addresses, :GetAvailableShippingAddresses

      def BuildGetAvailableShippingAddresses(options = {}, &block)
        klass     = GetAvailableShippingAddressesRequest
        object = options.is_a?(klass) ? options : klass.new(options || {})
        object.instance_eval(&block) if block
        object
      end
      alias_method :build_get_available_shipping_addresses, :BuildGetAvailableShippingAddresses

      # Service Call: GetShippingAddresses
      # @param GetShippingAddressesRequest
      # @return GetShippingAddressesResponse
      def GetShippingAddresses(options = {} , http_header = {})
        request_object  = BuildGetShippingAddresses(options)
        request_hash    = request_object.to_hash
        response_hash   = request("GetShippingAddresses", request_hash, http_header)
        GetShippingAddressesResponse.new(response_hash)
      end
      alias_method :get_shipping_addresses, :GetShippingAddresses

      def BuildGetShippingAddresses(options = {}, &block)
        klass     = GetShippingAddressesRequest
        object = options.is_a?(klass) ? options : klass.new(options || {})
        object.instance_eval(&block) if block
        object
      end
      alias_method :build_get_shipping_addresses, :BuildGetShippingAddresses

      # Service Call: GetUserLimits
      # @param GetUserLimitsRequest
      # @return GetUserLimitsResponse
      def GetUserLimits(options = {} , http_header = {})
        request_object  = BuildGetUserLimits(options)
        request_hash    = request_object.to_hash
        response_hash   = request("GetUserLimits", request_hash, http_header)
        GetUserLimitsResponse.new(response_hash)
      end
      alias_method :get_user_limits, :GetUserLimits

      def BuildGetUserLimits(options = {}, &block)
        klass     = GetUserLimitsRequest
        object = options.is_a?(klass) ? options : klass.new(options || {})
        object.instance_eval(&block) if block
        object
      end
      alias_method :build_get_user_limits, :BuildGetUserLimits

      # Service Call: GetPrePaymentDisclosure
      # @param GetPrePaymentDisclosureRequest
      # @return GetPrePaymentDisclosureResponse
      def GetPrePaymentDisclosure(options = {} , http_header = {})
        request_object  = BuildGetPrePaymentDisclosure(options)
        request_hash    = request_object.to_hash
        response_hash   = request("GetPrePaymentDisclosure", request_hash, http_header)
        GetPrePaymentDisclosureResponse.new(response_hash)
      end
      alias_method :get_pre_payment_disclosure, :GetPrePaymentDisclosure

      def BuildGetPrePaymentDisclosure(options = {}, &block)
        klass     = GetPrePaymentDisclosureRequest
        object = options.is_a?(klass) ? options : klass.new(options || {})
        object.instance_eval(&block) if block
        object
      end
      alias_method :build_get_pre_payment_disclosure, :BuildGetPrePaymentDisclosure


    end

  end
end
