AdaptivePaymentsSamples::Engine.routes.draw do
  match "adaptive_payments(/:action)",  :controller => "adaptive_payments", :as => :adaptive_payments
  root :to => "adaptive_payments#index"
end
