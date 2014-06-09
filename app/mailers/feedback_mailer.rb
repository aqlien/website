class FeedbackMailer < ActionMailer::Base
  default to: "codefellow@aqlien.com"

  def contact_me(name, email, message)
    @name = name
    @email = email
    @message = message

    mail(subject: "Your online portfolio made someone want to talk to you!", from: @email)
  end
end
