require 'spec_helper'

describe "AdaptivePaymentsSamples" do

  def get_response_value(key)
    if find(:id, 'response').text =~ /#{key}: ([^\s]*)/
      $1.dup
    end
  end

  before :each do
    visit adaptive_payments_samples_path
  end

  describe "Pay" do
    before :each do
      first(:link, "Pay").click
      click_on "Submit"
      page.should have_content("ack: Success")
      @pay_key = get_response_value("payKey")
    end

    it "Payment Details" do
      click_link "Payment Details"
      fill_in "Pay key", :with => @pay_key
      click_on "Submit"
      page.should have_content("ack: Success")
    end

    it "Refund" do
      click_link "Refund"
      fill_in "Pay key", :with => @pay_key
      click_on "Submit"
      page.should have_content("ack: Success")
    end

    it "Set Payment Options" do
      click_link "Set Payment Options"
      fill_in "Pay key", :with => @pay_key
      click_on "Submit"
      page.should have_content("ack: Success")
    end

    it "Get Payment Options" do
      click_link "Get Payment Options"
      fill_in "Pay key", :with => @pay_key
      click_on "Submit"
      page.should have_content("ack: Success")
    end

  end

  describe "Preapproval" do
    before :each do
      first(:link, "Preapproval").click
      click_on "Submit"
      page.should have_content("ack: Success")
      @preapproval_key = get_response_value("preapprovalKey")
    end

    it "Preapproval Details" do
      click_link "Preapproval Details"
      fill_in "Preapproval key", :with => @preapproval_key
      click_on "Submit"
      page.should have_content("ack: Success")
    end

    it "Cancel Preapproval" do
      click_link "Cancel Preapproval"
      fill_in "Preapproval key", :with => @preapproval_key
      click_on "Submit"
      page.should have_content("ack: Success")
    end

    it "Confirm Preapproval" do
      click_link "Confirm Preapproval"
      fill_in "Preapproval key", :with => @preapproval_key
      click_on "Submit"
      page.should have_content("ack: Success")
    end
  end

  it "Convert Current" do
    click_link "Convert Currency"
    click_button "Submit"
    page.should have_content("ack: Success")
  end

end
