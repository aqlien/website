class WelcomeController < ApplicationController

  def contact
    @contact = Contact.new
  end

  def message
    if @contact.valid?
      FeedbackMailer.contact_me(@contact).deliver
      redirect_to root_path, notice: "Email sent!"
    else
      render "/contact", notice: "All fields are required."
    end
  end
  
end
