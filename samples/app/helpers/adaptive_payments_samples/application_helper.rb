module AdaptivePaymentsSamples
  module ApplicationHelper
    def active_li(display, link_path, options = {})
      active_menu = options.delete(:match_path) ? request.path =~ Regexp.new(link_path) : request.path == link_path
      content_tag(:li, :class => active_menu ? "active" : "") do
        link_to(display, link_path, options)
      end
    end

    def active_li_regexp(display, link_path, options = {})
      active_li(display, link_path, options.merge(:match_path => true))
    end

    def api_form_for(object, *args, &block)
      options         = args.extract_options!
      options[:as]  ||= api_class_name(object.class)
      simple_form_for(object, *(args << options.merge(:builder => APIFormBuilder, :wrapper => :api_sample_form)), &block)
    end

    def generate_code(api_request, api_response)
      request_hash= api_request.to_hash(:namespace => false, :attribute => false)
      request_hash.delete(:Version)
      # request_hash  = get_dotted_hash(request_hash)
      response_hash = api_response.to_hash(:namespace => false, :attribute => false)
      ruby_code   = render("ruby_code.rb", :request_hash => request_hash, :response_hash => response_hash)
      ruby_code.html_safe
    end

    def get_dotted_hash(hash, prefix = "", values = {})
      max_lenght  = Hash[hash.select{|k, v| !(v.is_a? Hash or v.is_a? Array) }].keys.map(&:size).max
      hash.each do |key, value|
        if value.is_a? Hash
          get_dotted_hash(value, "#{prefix}#{key}.", values)
        elsif value.is_a? Array and value[0].is_a? Hash
          value.each_with_index do |array_value, index|
            get_dotted_hash(array_value, "#{prefix}#{key}[#{index}].", values)
          end
        elsif !value.nil?
          k = sprintf("%s%-#{max_lenght}s", prefix, key)
          values[k] = value
        end
      end
      values
    end

    def format_hash(hash)
      entries = hash.map do |key, value|
        "#{key.to_sym.inspect} => " +
          if value.is_a? Hash and value.size > 0
            format_hash(value)
          elsif value.is_a? Array and value[0].is_a? Hash
            "[" + value.map{|v| format_hash(v) }.join(",") + "]"
          else
            value.to_json
          end
      end
      indent_hash_entries(entries)
    end

    def indent_hash_entries(entries)
      if entries.size > 0
        "{\n" + entries.join(",\n").gsub(/^/, "  ") + " }"
      else
        "{}"
      end
    end

    def api_class_name(klass)
      klass.name.gsub(/^.*::/, "")
    end
  end
end
