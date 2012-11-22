module AdaptivePaymentsSamples
  class ApplicationController < ActionController::Base

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
