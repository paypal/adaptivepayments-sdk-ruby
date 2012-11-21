module AdaptivePaymentsSamples
  class APIFormBuilder < SimpleForm::FormBuilder
    def fields_for(member_name, member_object = nil, &block)
      member_object ||= ( object.send(member_name) || object.send("#{member_name}=", {}))
      member_options = object.class.members[member_name.to_sym]
      if member_options[:array]
        fields = []
        member_object.each_with_index do |obj, index|
          fields << super(member_name, obj, :index => index, &block)
        end
        fields.join.html_safe
      else
        super(member_name, member_object, &block)
      end
    end
    alias_method :simple_form_for, :fields_for
    alias_method :association, :fields_for

    def input(member_name, options = {})
      super(member_name, api_input_options(member_name, options))
    end

    def api_input_options(member_name, options = {})
      member_options      = object.class.members[member_name.to_sym]
      options[:label]   ||= member_name.to_s.underscore.humanize
      options[:wrapper] ||= :api_sample_form
      options[:required]  = !!member_options[:required] if options[:required].nil?
      if member_options[:type] < PayPal::SDK::Core::API::DataTypes::Enum
        options[:as] = ( member_options[:array] ? :check_boxes : :select )
        options[:collection] = member_options[:type].options
      elsif member_options[:type] == PayPal::SDK::Core::API::DataTypes::SimpleTypes::Boolean
        options[:as] = :select
        options[:collection] = [ true, false ]
      end
      options
    end
  end
end
