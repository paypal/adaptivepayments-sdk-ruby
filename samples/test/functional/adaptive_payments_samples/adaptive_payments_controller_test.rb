require 'test_helper'

module AdaptivePaymentsSamples
  class AdaptivePaymentsControllerTest < ActionController::TestCase
    test "should get pay" do
      get :pay
      assert_response :success
    end
  
  end
end
