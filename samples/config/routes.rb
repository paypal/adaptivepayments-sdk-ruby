AdaptivePaymentsSamples::Engine.routes.draw do
  post  "adaptive_payments/ipn_notify" => "adaptive_payments#ipn_notify", :as => :ipn_notify
  match "adaptive_payments(/:action)",  :controller => "adaptive_payments", :as => :adaptive_payments
  root :to => "adaptive_payments#index"
end
