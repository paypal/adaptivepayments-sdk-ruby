PayPal::SDK::Core::Config.load(File.expand_path("../../../../../../spec/config/paypal.yml", __FILE__), Rails.env.to_s)
PayPal::SDK::Core::Logging.logger = Rails.logger
