require "test_helper"

describe FeedbackMailer do
  before do
    @contact = Contact.new({name: "Bob McStanley", email: "bob@mcstanley.com", message: "I think you're cool!"})
    @email = FeedbackMailer.contact_me(@contact)
  end

  it "should be delivered to me" do
    @email.to.must_equal ["codefellow@aqlien.com"]
  end

  it "should tell me who it is from" do
    @email.from.must_equal ["codefellow@aqlien.com"]
  end

  # it "should include the name and message" do
  #   @email.body.to_s.must_include "Bob"
  #   @email.body.to_s.must_include "I think you're cool"
  # end
end
