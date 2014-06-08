class WelcomeController < ApplicationController

  def contact
  end

  def message
    # name = params[:name]
    # email = params[:email]
    # message = params[:message]
    FeedbackMailer.contact_me(params[:name], params[:email], params[:message]).deliver
    redirect_to root_path, notice: "Email sent!"
  end
end
