class FeedbackMailer < ActionMailer::Base
  default to: "codefellow@aqlien.com"

  def contact_me(contact)
    @contact = contact
    mail(subject: "Your online portfolio made someone want to talk to you!", from: "codefellow@aqlien.com")
  end
end
