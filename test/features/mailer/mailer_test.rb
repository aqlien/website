require "test_helper"

describe FeedbackMailer do
  before do
    @email = FeedbackMailer.contact_me("Bob", "example@example.com", "Hi, I like your portfolio.")
  end

  it "should be delivered to me" do
    @email.to.must_equal ["codefellow@aqlien.com"]
  end

  it "should tell me who it is from" do
    @email.from.must_equal ["example@example.com"]
  end

  # it "should include the name and message" do
  #   @email.body.to_s.must_include "Bob"
  #   @email.body.to_s.must_include "Hi, I like your portfolio"
  # end
end
