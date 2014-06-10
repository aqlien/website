class WelcomeController < ApplicationController

  def contact
    @contact = Contact.new
  end

  def message
    @contact = Contact.new(params[:contact])
    if @contact.valid?
      FeedbackMailer.contact_me(@contact).deliver
      redirect_to root_path, notice: "Email sent!"
    else
      render "welcome/contact", notice: "All fields are required."
    end
  end

end
