module AdaptivePaymentsSamples
  class Engine < ::Rails::Engine
    isolate_namespace AdaptivePaymentsSamples

    initializer "adaptive_payments_samples.add_active_model_to_data_types" do |app|
      PayPal::SDK::Core::API::DataTypes::Base.class_eval do
        include ActiveModel::Conversion
        extend ActiveModel::Naming

        def persisted?
          false
        end
      end
    end

    initializer "adaptive_payments_samples.configure_simple_form" do |app|
      SimpleForm.setup do |config|
        config.wrappers :api_sample_form, :tag => 'div', :class => 'control-group', :error_class => 'error' do |b|
          b.use :html5
          b.use :placeholder
          b.use :label
          b.wrapper :tag => 'div', :class => 'controls' do |ba|
            ba.use :input
            ba.use :error, :wrap_with => { :tag => 'span', :class => 'help-inline' }
            ba.use :hint,  :wrap_with => { :tag => 'p', :class => 'help-block' }
          end
        end
        config.form_class  = "simple_form form-horizontal"
        config.boolean_style = :nested
        config.label_class = "control-label"
        config.browser_validations = false
      end
    end

  end
end
