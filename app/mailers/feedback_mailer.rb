class FeedbackMailer < ActionMailer::Base
  default to: "codefellow@aqlien.com"

  def contact_me(contact)
    @name = contact.name
    @email = contact.email
    @message = contact.message

    mail(subject: "Your online portfolio made someone want to talk to you!", from: "codefellow@aqlien.com")
  end
end
