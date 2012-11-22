PayPal::SDK::Core::Config.load(Rails.root.join("config/paypal.yml"), Rails.env.to_s)
PayPal::SDK::Core::Logging.logger = Rails.logger
