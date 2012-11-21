module AdaptivePaymentsSamples
  class ApplicationController < ActionController::Base

    class << self
      def build_service(service, getter = "", setter = "_response", params_suffix = "Request")
        service_name  = service.to_s.underscore
        params_name   = "#{service}#{params_suffix.camelize}"
        define_method service_name do
          request_params    = params[params_name] || params[params_name.underscore] || params[service_name] || params[service]
          @api_request      = api.send("build_#{service_name}", request_params || default_api_value)
          @api_response     = api.send(service_name, @api_request) if request_params or request.post?
          instance_variable_set("@#{service_name}#{getter}", @api_request)
          instance_variable_set("@#{service_name}#{setter}", @api_response)
          respond_to do |format|
            format.html
            format.js{ render :api_response } if @api_response
          end
        end
      end

      def build_services(services, getter = "", setter = "_response", params_suffix = "Request")
        services.each do |service|
          build_service(service, getter, setter, params_suffix)
        end
      end
    end

    def default_api_value
      t("#{service_name}.#{service_action}", :default => {})
    end

    def service_name
      params[:controller].gsub(/^.*\//, "")
    end

    def service_action
      params[:action]
    end
    helper_method :service_action, :service_name

  end
end
