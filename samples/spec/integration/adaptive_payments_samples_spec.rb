require 'spec_helper'

describe "AdaptivePaymentsSamples" do

  before :each do
    visit adaptive_payments_samples_path
  end

  describe "Pay" do
    before :each do
      check_sample "Pay"
      @pay_key = get_response_value("payKey")
    end

    it_check_sample "Payment Details" do
      fill_in "Pay key", :with => @pay_key
    end

    it_check_sample "Refund" do
      fill_in "Pay key", :with => @pay_key
    end

    it_check_sample "Set Payment Options" do
      fill_in "Pay key", :with => @pay_key
    end

    it_check_sample "Get Payment Options" do
      fill_in "Pay key", :with => @pay_key
    end

  end

  describe "Preapproval" do
    before :each do
      check_sample "Preapproval"
      @preapproval_key = get_response_value("preapprovalKey")
    end

    it_check_sample "Preapproval Details" do
      fill_in "Preapproval key", :with => @preapproval_key
    end

    it_check_sample "Cancel Preapproval" do
      fill_in "Preapproval key", :with => @preapproval_key
    end

    it_check_sample "Confirm Preapproval" do
      fill_in "Preapproval key", :with => @preapproval_key
    end
  end

  it_check_sample "Convert Currency"

end
