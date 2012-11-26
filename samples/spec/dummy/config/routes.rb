Dummy::Application.routes.draw do

  mount AdaptivePaymentsSamples::Engine => "/samples", :as => :adaptive_payments_samples
  root :to => redirect("/samples")

end
